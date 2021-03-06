module ProductsHelper
  
  def display_price(price, discount_price=nil)
    content_tag :div, class: 'price' do
      if discount_price
        concat(content_tag :p, content_tag(:strike, decimal_to_euros(price), style: 'font-size: 18px') )
      end
      concat( content_tag :p, bold_price(discount_price || price) )
    end
  end
  
  def bold_price(price)
    content_tag :strong, style: 'font-size: 24px' do
      decimal_to_euros price
    end
  end

  def decimal_to_euros(price)
    content_tag :span, style: 'white-space: nowrap;' do
      number_to_currency price, 
                       unit: t('currency'), 
                       separator: t('separator'), 
                       delimiter: t('delimiter'), 
                       format: '%u %n'
    end
  end
  
  def stock_status(in_stock)
    css_class = in_stock ? 'in-stock' : 'coming-soon'
    content_tag :p, class: css_class do
      in_stock ? 'In Stock' : 'Coming Soon!'
    end
  end
  
end
