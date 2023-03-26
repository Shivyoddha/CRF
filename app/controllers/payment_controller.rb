class PaymentController < ApplicationController
  def payment
    @equipment = EquipmentTable.all
    @equipment = EquipmentTable.order(updated_at: :desc)

  end
  def paymentC
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)

  end
  def paymentD
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentExt
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentExtC
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def payementExtM
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
  end
  def paymentExtR
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def payementExtU
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentM
      @xrd = Xrd.all
      @equipment = EquipmentTable.new
  end
  def paymentP
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentS
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentU
      @xrd = Xrd.all
      @entry = params[:entry]
      @equipment = EquipmentTable.all
  end
  def paymentA
      @xrd = Xrd.all
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
end
