class ItemsController < ApplicationController
  def index
    matching_items = Item.all

    @list_of_items = matching_items.order({ :created_at => :desc })

    render({ :template => "items/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_items = Item.where({ :id => the_id })

    @the_item = matching_items.at(0)

    render({ :template => "items/show.html.erb" })
  end

  def create
    the_item = Item.new
    user_name = params.fetch("query_user_name")
    user = User.where({:user_name=>user_name}).at(0)
    the_item.user_id = user.id
    the_item.description = params.fetch("query_description")
    the_item.quantity = params.fetch("query_quantity")
    the_item.image = params.fetch("query_image")
    the_item.price = params.fetch("query_price")
    the_item.item_name = params.fetch("query_item_name")
    the_item.available = params.fetch("query_available", false)

    if the_item.valid?
      the_item.save
      redirect_to("/items", { :notice => "Item created successfully." })
    else
      redirect_to("/items", { :alert => the_item.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.user_id = params.fetch("query_user_id")
    the_item.description = params.fetch("query_description")
    the_item.quantity = params.fetch("query_quantity")
    the_item.image = params.fetch("query_image")
    the_item.price = params.fetch("query_price")
    the_item.item_name = params.fetch("query_item_name")
    the_item.available = params.fetch("query_available", false)

    if the_item.valid?
      the_item.save
      redirect_to("/items/#{the_item.id}", { :notice => "Item updated successfully."} )
    else
      redirect_to("/items/#{the_item.id}", { :alert => the_item.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_item = Item.where({ :id => the_id }).at(0)

    the_item.destroy

    redirect_to("/items", { :notice => "Item deleted successfully."} )
  end
end
