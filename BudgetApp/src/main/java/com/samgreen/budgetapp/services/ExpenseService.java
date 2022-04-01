package com.samgreen.budgetapp.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.samgreen.budgetapp.models.Expense;
import com.samgreen.budgetapp.repositories.ExpenseRepository;

@Service

public class ExpenseService {
	private final ExpenseRepository repo;
	
	public ExpenseService(ExpenseRepository repo) {
		this.repo = repo;
	}
	
	public List<Expense> all() {
		return repo.findAll();
	}
	
	public Expense createExpense(Expense expense) {
		return repo.save(expense);
	}
	
	public Expense update(Expense expense) {
		return repo.save(expense);
	}
	

	
	public Expense find(Long id) {
		Optional<Expense> optionalExpense = repo.findById(id);
		if(optionalExpense.isPresent() ) {
			return optionalExpense.get();
		}
		else {
			return null;
		}
	}
	
	public void delete(Long id) {
		repo.deleteById(id);
	}

}
