package com.avizva.service;

import java.util.List;

import com.avizva.model.Supplier;

public interface SupplierService {
	
	public Supplier saveSupplier(Supplier supplier);

	public Supplier updateSupplier(Supplier supplier);

	public boolean deleteSupplier(int id);

	public Supplier getSupplier(int id);

	public Supplier getSupplier(String supplierId);	
	
	public List<Supplier> getAllSuppliers();


}
