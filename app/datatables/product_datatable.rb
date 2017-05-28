class ProductDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
        id: { source: "Product.id", cond: :eq },
        description: { source: "Product.description", cond: :like },
        #subgroup: { source: "Product.product_subgroup.description", cond: :eq },
        #cost_price: { source: "Product.cost_price", cond: :eq },
        #sale_price: { source: "Product.sale_price", cond: :eq },
        #created_at: { source: "Product.created_at", cond: :eq }
    }
  end

  def data
    records.map do |r|
      {
          # example:
          # id: record.id,
          # name: record.name
          id: r.id,
          description: r.description,
          subgroup: r.product_subgroup.try(:description),
          cost_price: r.cost_price,
          sale_price: r.sale_price,
          created_at: r.created_at
      }
    end
  end

  private

  def get_raw_records
    #Product.select 'id', 'description', 'cost_price', 'sale_price', 'created_at', 'subgroup.description'
    Product.all
  end



  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end
