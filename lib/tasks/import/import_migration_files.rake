namespace :import do
  desc "Deletes all existing MacBarfly data and imports new data from csv files in given directory"
  require 'csv'
  IMPORT_DIR = "/Users/rachelcollingridge/Downloads/barfly_data/"

  task import_migration_files: :environment do
    @destroyed_at = DateTime.now #update all destroyed_at records with same timestamp

    import_model Product
    import_model Person
    import_model LineItem
    import_model Payment
  end

  def import_model(klass)
    init_model klass

    CSV.foreach("#{IMPORT_DIR}#{klass.name}.csv", import_options) do |row|
      unless row.to_hash["Id"] == "NULL"
        row_hash = convert_csv_field_names(row.to_hash, klass, @destroyed_at)
        klass.send :create!, row_hash
      end
    end
    puts "Created #{klass.all.size} #{klass.name} records"
  end

  def init_model(klass)
    klass.send :delete_all
    klass.send :reset_pk_sequence
  end

  def import_options
    @import_options ||= {:headers => true, :converters => :numeric}
  end

  def convert_csv_field_names(row_hash, klass, destroyed_at = DateTime.now)
    row_hash = convert_key_strings_to_symbols(row_hash)
    row_hash = convert_old_key_names_to_new(row_hash, klass)
  end

  def convert_key_strings_to_symbols(row_hash )
    row_hash.keys.each do |key|
      row_hash[key.titleize.parameterize.underscore.to_sym] = row_hash.delete key
    end
    row_hash
  end

  def convert_old_key_names_to_new(row_hash, klass)
    case klass.name
    when LineItem.to_s
      row_hash.delete :total_cost
      row_hash.delete :last_modified_date
      row_hash[:purchased_on] = row_hash.delete :purchase_date
      row_hash = update_foreign_keys(row_hash)
    when Payment.to_s
      row_hash[:paid_on] = row_hash.delete :payment_date
      row_hash.delete :last_modified_date
      row_hash = update_foreign_keys(row_hash)
    when Person.to_s
      row_hash[:last_name] = row_hash.delete :surname
    end

    row_hash[:migration_id] = row_hash.delete :id
    if row_hash[:is_deleted]
      row_hash[:destroyed_at] = row_hash.delete :is_deleted
      row_hash[:destroyed_at] = (row_hash[:destroyed_at] == "TRUE" ? @destroyed_at : nil)
    end

    row_hash
  end

  def update_foreign_keys(row_hash)
    if row_hash[:person_key]
      person = Person.where(:migration_id => row_hash[:person_key]).first
      row_hash[:person] = person
      row_hash.delete :person_key
    end

    if row_hash[:product_key]
      product = Product.where(:migration_id => row_hash[:product_key]).first
      row_hash[:product] = product
      row_hash.delete :product_key
    end
    row_hash
  end
end
