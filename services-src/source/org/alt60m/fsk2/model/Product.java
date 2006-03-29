package org.alt60m.fsk2.model;

import java.io.BufferedInputStream;
import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.Session;

/**
 * 
 * @author matthew.drees
 *
 */
@Entity
@Table(name="fsk_Products")
public class Product extends Persistent<Product> {

	
	private String name;
	private String description;
	private String imageFilename;
	private Double price;
	private Integer quantity;
	private int kitCategory_id;
	//private Category category;
	
	public Product() {
		super(Product.class);
	}
	
	public Product(int id)
	{
		super(Product.class);
		setId(id);
	}
		
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	@Column(name="image_filename")
	public String getImageFilename() {
		return imageFilename;
	}
	public void setImageFilename(String imageFilename) {
		this.imageFilename = imageFilename;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
	public int getKitCategory_id() {
		return kitCategory_id;
	}

	public void setKitCategory_id(int kitCategory_id) {
		this.kitCategory_id = kitCategory_id;
	}

	public String toString()
	{
		return "Name: " + getName() + "\n" 
		+ "price:" + getPrice();
	}
	
	
}
