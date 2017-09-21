package com.avizva.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.avizva.pojo.OrderStatus;

@Entity
public class UserOrders {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "billingAddressId", insertable = false, updatable = false)
	private Address billingAddress;

	private int billingAddressId;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "shippingAddressId", insertable = false, updatable = false)
	private Address shippingAddress;

	private int shippingAddressId;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userId", updatable = false, insertable = false)
	private User user;

	private int userId;

	@OneToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "paymentId")
	private Payment payment;

	@OneToMany(fetch = FetchType.EAGER)
	private List<CartItem> items;

	@Enumerated(EnumType.STRING)
	private OrderStatus orderStatus;

	private double orderAmount;

	@Temporal(TemporalType.TIMESTAMP)
	private Date orderDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Address getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(Address billingAddress) {
		this.billingAddress = billingAddress;
	}

	public int getBillingAddressId() {
		return billingAddressId;
	}

	public void setBillingAddressId(int billingAddressId) {
		this.billingAddressId = billingAddressId;
	}

	public Address getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(Address shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public int getShippingAddressId() {
		return shippingAddressId;
	}

	public void setShippingAddressId(int shippingAddressId) {
		this.shippingAddressId = shippingAddressId;
	}

	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}

	public OrderStatus getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(OrderStatus orderStatus) {
		this.orderStatus = orderStatus;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Payment getPayment() {
		return payment;
	}

	public void setPayment(Payment payment) {
		this.payment = payment;
	}

	public double getOrderAmount() {
		return orderAmount;
	}

	public void setOrderAmount(double orderAmount) {
		this.orderAmount = orderAmount;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "UserOrders [id=" + id + ", billingAddress=" + billingAddress + ", billingAddressId=" + billingAddressId
				+ ", shippingAddress=" + shippingAddress + ", shippingAddressId=" + shippingAddressId + ", user=" + user
				+ ", userId=" + userId + ", payment=" + payment + ", items=" + items + ", orderStatus=" + orderStatus
				+ ", orderAmount=" + orderAmount + ", orderDate=" + orderDate + "]";
	}
	
	

}
