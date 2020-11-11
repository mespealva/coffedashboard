class DashboardController < ApplicationController
  
  def index

    @sales_month = Sale.group_by_month(:date, last: 12, current: false).order(date: :asc).sum(:amount)
    @quantity_month = Sale.group_by_month(:date, last: 12, current: false).order(date: :asc).count
    @sales_prom = Sale.group_by_month(:date, last: 12, current: false).order(date: :asc).average(:amount)

    @quantity_product_12 = Product.includes(:sales).where(sales: {date: (12.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")
    @quantity_product_6 = Product.includes(:sales).where(sales: {date: (6.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")
    @quantity_product_3 = Product.includes(:sales).where(sales: {date: (3.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")
    @quantity_product_1 = Product.includes(:sales).where(sales: {date: (1.months.ago.at_beginning_of_month..Date.today.at_beginning_of_month)}).group("sales.product_id").pluck("products.name, sum(sales.amount)")

  end

end
