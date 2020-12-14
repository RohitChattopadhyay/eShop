package eShop;

import java.util.Date;

public class Apparel {
    private int product_id;
    private String name;
    private String gender;
    private int cost;
    private int discount;
    private Date added_on;

    public Apparel(int product_id, String name, String gender, int cost, int discount, Date added_on) {
        this.product_id = product_id;
        this.name = name;
        this.gender = gender;
        this.cost = cost;
        this.discount = discount;
        this.added_on = added_on;
    }

    public int getProduct_id() {
        return product_id;
    }

    public String getName() {
        return name;
    }
    public String getGender() {
        return gender;
    }
    public int getSellingPrice() {
        return cost - discount;
    }
    public boolean isDiscounted() {
        return discount>0;
    }    
    public String getCost() {
        return "&#8377; " + Integer.toString(cost);
    }
    public boolean isNew() {
        Date today = new Date();  
        return (today.getTime()-added_on.getTime()<604800001);
    }    
    public Date getAdded_on() {
        return added_on;
    }
}
