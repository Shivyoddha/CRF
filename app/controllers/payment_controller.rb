class PaymentController < ApplicationController
  def payment
    @equipment = EquipmentTable.all
    @equipment = EquipmentTable.order(updated_at: :desc)

  end
  def paymentC
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentCc
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentD
    @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentDc
    @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentExt
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentExtC
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def payementExtM
      @equipment = EquipmentTable.new
  end

  def paymentExtR
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end
  def paymentExtU
      @entry = params[:entry]
      @equipment = EquipmentTable.all
  end

  def paymentM
      @equipment = EquipmentTable.new
  end

  def paymentP
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentPc
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentS
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentSc
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def paymentU
      @entry = params[:entry]
      @equipment = EquipmentTable.all
  end

  def paymentA
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def payment_completed
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def proforma_confirmation
      @equipment = EquipmentTable.all
      @equipment = EquipmentTable.order(updated_at: :desc)
  end

  def generate_pdf
  @equipment_table = EquipmentTable.find(params[:id])

  respond_to do |format|
    format.pdf do
      render pdf: "file_name",
             template: "payment/payment_pdf.html.erb",
             layout: "pdf.html",
             show_as_html: params.key?('debug'),
            locals:{ equipment_table: @equipment_table }
    end
  end
end

end
