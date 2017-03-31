require_relative 'invoice_controller'

p 'admin:'
i = InvoiceController.new('admin','password')
i.save
i.display_all
i.destroy
i.display_all
i.update
i.display_all

p 'seba:'
i2 = InvoiceController.new('seba', '123')
i2.save
i2.save
i.display_all