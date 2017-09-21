package com.avizva.service.impl;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.avizva.dao.AddressDao;
import com.avizva.model.Address;
import com.avizva.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	private static final Logger LOGGER = LogManager.getLogger();

	@Autowired
	private AddressDao addressDao;

	@Override
	@Transactional
	public Address saveAddress(Address address) {
		LOGGER.info("Saving address");
		System.out.println(address);
		return addressDao.save(address);
	}

	@Override
	public Address updateAddress(Address address) {
		LOGGER.info("Updating address");
		return addressDao.update(address);
	}

	@Override
	public Address deactivateAddress(Address address) {
		LOGGER.info("Deactivating address");
		address.setActive(false);
		return addressDao.update(address);
	}

	@Override
	public Address getAddressById(int id) {
		LOGGER.info("Getting address by id " + id);
		return addressDao.get(id);
	}

	@Override
	public List<Address> getActiveAddresssByUserId(int userId) {
		LOGGER.info("Getting address by userId " + userId);
		return addressDao.getActiveAddressesByUserId(userId);
	}

}
