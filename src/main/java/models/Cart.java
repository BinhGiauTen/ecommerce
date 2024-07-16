package models;

import java.util.ArrayList;
import java.util.Iterator;




public class Cart {
	private ArrayList<CartItem> alCartItems = new ArrayList<CartItem>();
	private double totalPrice;
	
	public int getLineItemCount() {
		return alCartItems.size();	
	}

	public void addCartItem(String productId, String productName, String img_url, float oldPrice, int discount, int quantity) {
		float price = 0;
		float totalCost = 0;
		CartItem cartItem = new CartItem();
		try {
			
			if(quantity > 0) {
				
				price = oldPrice - (oldPrice* discount)/100;
				totalCost = price * quantity;
				cartItem.setProductId(productId);
				cartItem.setProductName(productName);
				cartItem.setImg_url(img_url);
				cartItem.setOldPrice(oldPrice);
				cartItem.setDiscount(discount);
				cartItem.setQuantity(quantity);
				cartItem.setTotalCost(totalCost);
				alCartItems.add(cartItem);
				calculateOrderTotal();
			}
		}
		catch (NumberFormatException nfe) {
			System.out.println("Error while parsing from String ot primitive types:" + nfe.getMessage());
			nfe.printStackTrace();
		}
	}
	
	public void updateCartItem(String productId, int quantity) {
        try {
            for (CartItem cartItem : alCartItems) {
                if (cartItem.getProductId().equals(productId)) {
                    if (quantity > 0) {
                        cartItem.setQuantity(quantity);
                        float price = cartItem.getOldPrice() - (cartItem.getOldPrice() * cartItem.getDiscount()) / 100;
                        cartItem.setTotalCost(price * quantity);
                    } else {
                        alCartItems.remove(cartItem);
                    }
                    break;
                }
            }
            calculateOrderTotal();
        } catch (Exception e) {
            System.out.println("Error while updating cart item: " + e.getMessage());
            e.printStackTrace();
        }
    }
	
	public void deleteCartItem(String productId) {
		try {
			for (Iterator<CartItem> iterator = alCartItems.iterator(); iterator.hasNext();) {
				CartItem cartItem = iterator.next();
				if (cartItem.getProductId().equals(productId)) {
					iterator.remove();
					break;
				}
			}
			calculateOrderTotal();
		} catch (Exception e) {
			System.out.println("Error while deleting cart item:" + e.getMessage());
			e.printStackTrace();
		}
	}
	
	public void addCartItem(CartItem cartItem) {
		alCartItems.add(cartItem);
	}
	
	public CartItem getCartItem(int iItemIndex){
		CartItem cartItem = null;
		if(alCartItems.size() > iItemIndex) {
			cartItem = (CartItem)alCartItems.get(iItemIndex);
		}
		return cartItem;
		
	}
	
	public ArrayList<CartItem> getCartItems(){
		return alCartItems;
	}
	
	public void setCartItems(ArrayList<CartItem> alCartItems) {
		this.alCartItems = alCartItems;
	}
	
	
	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	protected void calculateOrderTotal() {
		double dblTotal = 0;
		for(int counter = 0; counter < alCartItems.size(); counter ++ ) {
			CartItem cartItem = (CartItem) alCartItems.get(counter);
			dblTotal += cartItem.getTotalCost();
		}
		setTotalPrice(dblTotal);
	}

}
