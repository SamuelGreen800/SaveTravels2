package com.samgreen.budgetapp.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="expenses")

public class Expense {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min = 1, max = 200, message = "Name required")
	private String name;
	
	@NotNull
	@Size(min=1, max=200, message="Wendor required")
	private String vendor;
	
	@NotNull(message="Amount must not be blank!")
	@Min(value=0, message="Amount must be greater than zero")
	private Double amount;
	
	@NotNull
	@Size(min=1, max=500, message="Please give a short description")
	private String description;
	
	
	@Column(name="created_at")
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date created_at;
	
	@Column(name="updated_at")
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updated_at;
	
	
	
	public Expense() {}
	
	public Expense(Long id, String name, String vendor, Double amount, String description, Date created_at, Date updated_at) {
		this.id = id;
		this.name = name;
		this.vendor = vendor;
		this.amount = amount;
		this.description = description;
		this.created_at = created_at;
		this.updated_at = updated_at;
		
	}
	
	@PrePersist
    protected void onCreate(){
        this.created_at = new Date();
    }
    public Date getCreated_at() {
		return created_at;
	}

	public void setCreated_at(Date created_at) {
		this.created_at = created_at;
	}

	public Date getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(Date updated_at) {
		this.updated_at = updated_at;
	}

	@PreUpdate
    protected void onUpdate(){
        this.updated_at = new Date();
    }
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getVendor() {
		return vendor;
	}

	public void setVendor(String vendor) {
		this.vendor = vendor;
	}


	public Double getAmount() {
		return amount;
	}

	public void setAmount(Double amount) {
		this.amount = amount;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
