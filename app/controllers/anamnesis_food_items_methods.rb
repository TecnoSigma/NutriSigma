module AnamnesisFoodItemsMethods
  def all_food_items_check
    check_food_items(anamnesis_food_item_params[:morning_food_item],anamnesis_food_item_params[:morning_food_item_quantity],"manha")
    check_food_items(anamnesis_food_item_params[:noon_food_item], anamnesis_food_item_params[:noon_food_item_quantity],"tarde")
    check_food_items(anamnesis_food_item_params[:evening_food_item], anamnesis_food_item_params[:evening_food_item_quantity],"noite")
  end


  def anamnesis_food_item_params
    params.permit(morning_food_item:[],
      noon_food_item:[],
      evening_food_item:[],
      morning_food_item_quantity:[],
      noon_food_item_quantity:[],
      evening_food_item_quantity:[])
  end
  def all_food_items_save
    save_food_items(anamnesis_food_item_params[:morning_food_item],anamnesis_food_item_params[:morning_food_item_quantity],"manha")
    save_food_items(anamnesis_food_item_params[:noon_food_item], anamnesis_food_item_params[:noon_food_item_quantity],"tarde")
    save_food_items(anamnesis_food_item_params[:evening_food_item], anamnesis_food_item_params[:evening_food_item_quantity],"noite")
  end

  def check_food_items(food_item_array,quantity_item_array,meal_time_type)
    food_item_array.each_index do |n|
      anamnesis_food_item = AnamnesisFoodItem.new(equivalent_food_id: food_item_array[n], quantity: quantity_item_array[n], meal_time: meal_time_type)
      unless anamnesis_food_item.valid? && quantity_item_array[n].to_f > 0
        render 'new'
        break
      end
    end
  end

  def save_food_items(food_item_array,quantity_item_array,meal_time_type)
    food_item_array.each_index do |n|
      @anamnesis_food_item = AnamnesisFoodItem.new(equivalent_food_id: food_item_array[n], quantity: quantity_item_array[n], meal_time: meal_time_type, anamnesis_id: @patient.anamnesis.id)
      @anamnesis_food_item.save
    end
  end
end