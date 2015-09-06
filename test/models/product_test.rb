require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products

  test "product attributes must not be empty" do
    product = Product.new
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:image_url].any?
    assert product.errors[:price].any?
  end

  test "price must be positive" do
    product = Product.new(title: "New Title",
                          description: "asd",
                          image_url: "aaa.jpg")
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
    end

    def new_product(image_url)
      product = Product.new(title: "New Title",
                          description: "asd",
                          image_url: image_url,
                          price: 1)
    end

    test "image url" do
      ok = %w{asd.jpg asd.png asd.gif asd.Jpg asd.JPG}
      bad = %w{asd.pdf asd.bmp asd.jpg/xxx asd.gif.yyy}
      ok.each do |name|
        assert new_product(name).valid?, "#{name} should be vaild"
      end
      bad.each do |name|
        assert new_product(name).invalid?, "#{name} should be invaild"
      end
    end

    test "product id not valid without a unique title" do
      product = Product.new(title: products(:ruby).title,
                            description: 'yyy',
                            image_url: 'image.jpg',
                            price: 1)
      assert product.invalid?
      assert_equal [I18n.translate('errors.messages.taken')], product.errors[:title]
    end
end
