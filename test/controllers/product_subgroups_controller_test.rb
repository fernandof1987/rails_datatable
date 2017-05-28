require 'test_helper'

class ProductSubgroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product_subgroup = product_subgroups(:one)
  end

  test "should get index" do
    get product_subgroups_url
    assert_response :success
  end

  test "should get new" do
    get new_product_subgroup_url
    assert_response :success
  end

  test "should create product_subgroup" do
    assert_difference('ProductSubgroup.count') do
      post product_subgroups_url, params: { product_subgroup: { description: @product_subgroup.description, product_group_id: @product_subgroup.product_group_id } }
    end

    assert_redirected_to product_subgroup_url(ProductSubgroup.last)
  end

  test "should show product_subgroup" do
    get product_subgroup_url(@product_subgroup)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_subgroup_url(@product_subgroup)
    assert_response :success
  end

  test "should update product_subgroup" do
    patch product_subgroup_url(@product_subgroup), params: { product_subgroup: { description: @product_subgroup.description, product_group_id: @product_subgroup.product_group_id } }
    assert_redirected_to product_subgroup_url(@product_subgroup)
  end

  test "should destroy product_subgroup" do
    assert_difference('ProductSubgroup.count', -1) do
      delete product_subgroup_url(@product_subgroup)
    end

    assert_redirected_to product_subgroups_url
  end
end
