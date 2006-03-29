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
public class Product extends Persistent {

	private String name;
	private String description;
	private String imageFilename;
	private Double price;
	private Integer quantity;
	//private Category category;
	
	public Product() {}
	
	public Product(int id)
	{
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
	
	public String toString()
	{
		return "Name: " + getName() + "\n" 
		+ "price:" + getPrice();
	}
}
