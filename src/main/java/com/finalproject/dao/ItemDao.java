package com.finalproject.dao;

import java.util.List;

import com.finalproject.entity.Item;


public interface ItemDao {

	void insert(Item item);
	
	void update(Item item);
	
	void delete(long itemId);
	
	List<Item> findAll(int pageIndex, int pageSize);
	
	List<Item> findByOrderId(long orderId);
}
