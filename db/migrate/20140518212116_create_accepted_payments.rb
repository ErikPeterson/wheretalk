class CreateAcceptedPayments < ActiveRecord::Migration
  def change
    create_table :accepted_payments do |t|
      t.integer :payment_method_id
      t.integer :user_id

      t.timestamps
    end
  end
end
