class DeviseSmsActivableAddTo<%= table_name.camelize %> < ActiveRecord::Migration
  def self.up
    change_table :<%= table_name %> do |t|
      t.string   :phone
      t.string   :sms_confirmation_token, :limit => 15
      t.datetime :confirmation_sms_sent_at
      t.datetime :sms_confirmed_at
    end

    add_index :<%= table_name %>, :phone, unique: true
    add_index :<%= table_name %>, :sms_confirmation_token, unique: true
  end
  
  def self.down
    remove_column :<%= table_name %>, :sms_confirmation_token
    remove_column :<%= table_name %>, :sms_confirmed_at
    remove_column :<%= table_name %>, :confirmation_sms_sent_at
    remove_column :<%= table_name %>, :phone
  end
end
