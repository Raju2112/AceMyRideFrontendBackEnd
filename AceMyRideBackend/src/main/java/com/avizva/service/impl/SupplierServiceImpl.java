package com.avizva.service.impl;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.avizva.dao.SupplierDao;
import com.avizva.model.Supplier;
import com.avizva.service.SupplierService;

@Service
public class SupplierServiceImpl implements SupplierService {

	@Autowired
	private SupplierDao supplierDao;
	
	public Supplier saveSupplier(Supplier supplier) {
		supplier.setEnabled(true);
		supplier.setDescription(supplier.getDescription().trim());
		Supplier savedSupplier=supplierDao.save(supplier);
		return savedSupplier;
	}

	public Supplier updateSupplier(Supplier supplier) {
		supplier.setEnabled(true);
		supplier.setDescription(supplier.getDescription().trim());
		Supplier updatedSupplier=supplierDao.update(supplier);
		return updatedSupplier;
	}

	public boolean deleteSupplier(int id) {
		Supplier deletedSupplier = supplierDao.delete(id);
		if (deletedSupplier == null)
			return false;
		return true;
	}

	public Supplier getSupplier(int id) {
		return supplierDao.view(id);
	}

	public Supplier getSupplier(String supplierId) {
		return supplierDao.view(supplierId);
	}
	
	public List<Supplier> getAllSuppliers()
	{
		List<Supplier> completeList=supplierDao.viewAll();
		return completeList.stream().filter(supplier -> supplier.isEnabled()).collect(Collectors.toList());
	}


}
