package com.samgreen.budgetapp.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.samgreen.budgetapp.models.Expense;
import com.samgreen.budgetapp.services.ExpenseService;
@Controller
public class ExpenseController {
	
		@Autowired 
		private ExpenseService expenseService;

		@GetMapping("/")
		public String landing() {
			return "redirect:/expenses";
		}
		
		@GetMapping("/expenses")
		public String index(@ModelAttribute("expense") Expense expense, Model model) {
			model.addAttribute("expenses", expenseService.all());
			return "index.jsp";
	}
		
		@PostMapping("/submit")
		public String saveExpense(@Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
				if(result.hasErrors()) {
					
					model.addAttribute("expenses", expenseService.all());
					return "/index.jsp";
				}
				else {
					expenseService.createExpense(expense);
					return "redirect:/expenses";
				}
		}
		
		//=========================view route===================
		
		@GetMapping("/expenses/{id}")
		public String view(@PathVariable("id") Long id, Model model) {
			model.addAttribute("expense", expenseService.find(id));
			return "view.jsp";
	}
		
		//==============================Edit routes======================
		
		@GetMapping("/edit/{id}")
		public String edit(@PathVariable("id") Long id, Model model) {
			
			model.addAttribute("expense", expenseService.find(id));
			model.addAttribute("expenses", expenseService.all());
			
			return "edit.jsp";
		}
		
		@PutMapping("update/{id}")
		public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("expense") Expense expense, BindingResult result, Model model) {
			if (result.hasErrors()) {
				model.addAttribute("expenses", expenseService.all());
				return "edit.jsp";
			}
			else {
				expenseService.update(expense);
				return "redirect:/expenses";
			}
			
		}
		
		//==========================delete===========================s
		@DeleteMapping("/delete/{id}")
		public String delete(@PathVariable("id") Long id) {
			expenseService.delete(id);
			return "redirect:/expenses";
		}
		

		public ExpenseService getExpense() {
			return expenseService;
		}

		public void setExpense(ExpenseService expense) {
			this.expenseService = expense;
		}



	}



