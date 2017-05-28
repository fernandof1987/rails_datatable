class ProductGroupDatatable < AjaxDatatablesRails::Base

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "ProductGroup.id", cond: :eq },
      description: { source: "ProductGroup.description", cond: :like }}
  end

  def data
    records.map do |r|
      {
        # example:
        # id: record.id,
        # name: record.name
          id: r.id,
          description: r.description
      }
    end
  end

  private

  def get_raw_records
    ProductGroup.select 'id', 'description'
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
