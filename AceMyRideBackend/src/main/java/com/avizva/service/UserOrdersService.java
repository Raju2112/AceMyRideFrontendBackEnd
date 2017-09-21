package com.avizva.service;

import com.avizva.model.Address;
import com.avizva.model.Payment;
import com.avizva.model.UserOrders;

public interface UserOrdersService {

	public UserOrders updateOrder(int orderId, Address shippingAddress);

	public UserOrders updateOrderAfterPayment(int orderId, Address billingAddress, Payment payment, boolean isNew);

	public UserOrders saveOrder(int userID, Address shippingAddress, boolean isNew);
	
	public UserOrders getUserOrder(int id);

}
