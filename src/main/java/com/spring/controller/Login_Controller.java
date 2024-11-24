package com.spring.controller;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.spring.model.Customer_bean;
import com.spring.model.LoginBean;
import com.spring.model.ProductBean;

import com.spring.repo.Customer_Login;
import com.spring.repo.Product_Repo;



@Controller
public class Login_Controller {
	
	@Autowired
	private Customer_Login c_repo;
	@Autowired
	private Product_Repo pRepo;
	
	
	 @GetMapping("/")
	    public String showIndex(Model model) {       
	        List<ProductBean> products = pRepo.getProduct();
	        model.addAttribute("productList", products);
	        return "index";
	    }
	
	

	@GetMapping(value="register")
	public ModelAndView showRegister() {
		Customer_bean user=new Customer_bean();
		return new ModelAndView("register","CustomerObj",user);
	}
	
	@PostMapping("insert")
	public String doRegister(@ModelAttribute("CustomerObj")Customer_bean user,BindingResult br,Model m) throws SQLException {
		
		int i=c_repo.cust_register(user);
		
		if(i>0) {
			return "redirect:/login";
		}
		else {
			m.addAttribute("error","Insert Fail!!!");
			return "register";	
		}
	}
	
	
	@GetMapping(value="login")
	public ModelAndView showLogin() {
		Customer_bean user=new Customer_bean();
		return new ModelAndView("login","CustomerObj",user);
	}
	
	@PostMapping("/doLogin")
	public String doLogin(
	    @ModelAttribute("CustomerObj") LoginBean user, 
	    Model m, 
	    HttpSession session, 
	    RedirectAttributes redirectAttrs) {

	    String adminName = "Admin";
	    String adminEmail = "admin@gmail.com";
	    String adminPassword = "Admin1234";

	    // Check if the user is an admin
	    if (adminEmail.equals(user.getEmail()) && adminPassword.equals(user.getPassword())) {
	        // Set admin session attributes
	        session.setAttribute("loggedInAdmin", adminName);
	        redirectAttrs.addFlashAttribute("successMessage", "Admin logged in successfully!");
	        return "redirect:/admin"; // Redirect to admin page
	    }

	    // Check if the email exists for a regular user
	    boolean emailExists = c_repo.checkEmail(user.getEmail());
	    if (!emailExists) {
	        m.addAttribute("error", "Invalid Email!!");
	        return "login"; // Redirect back to login page
	    }

	    // Authenticate user
	    Customer_bean authenticatedUser = c_repo.doLogin(user);
	    if (authenticatedUser == null) {
	        m.addAttribute("error", "Incorrect Password!!");
	        return "login"; // Redirect back to login page
	    }

	    // Set user session attributes
	    session.setAttribute("loggedInUser", authenticatedUser);
	    session.setAttribute("uEmail", authenticatedUser.getEmail());
	    session.setAttribute("uID", authenticatedUser.getId());
	    session.setAttribute("uName", authenticatedUser.getName());

	    if (authenticatedUser.isAddToCartstatus()) {
	        return "redirect:/addToCart"; // Redirect to addToCart if applicable
	    }

	    redirectAttrs.addFlashAttribute("successMessage", "User logged in successfully!");
	    return "redirect:/"; // Redirect to index page
	}

	
	
	
	@GetMapping("/admin")
    public String showAdmin() {
        
        return "admin_view";
    }
	@GetMapping("/home")
    public String showHome() {
        
        return "redirect:/";
    }
	
	 @GetMapping("/logout")
	    public String logout(HttpSession session) {
	        session.invalidate();
	        return "redirect:/";
	    }
	 
	 
	 @GetMapping("/changeProfile")
	 public String showChangeProfileForm(ModelMap map, HttpSession session) {
	     String email = (String) session.getAttribute("uEmail"); // Retrieve email from session

	     if (email == null) {
	         map.addAttribute("error", "Session expired or user not logged in.");
	         return "redirect:/login"; // Redirect to login if no user is logged in
	     }

	     Customer_bean custBean = c_repo.getUserByEmail(email);
	     if (custBean == null) {
	         map.addAttribute("error", "User not found!");
	         return "error"; // Return error page if the user isn't found
	     }

	     map.addAttribute("user", custBean);
	     return "profile"; // Return the profile view
	 }

	 @PostMapping("/updateProfile")
	 public String updateProfile(@ModelAttribute("user") Customer_bean user, RedirectAttributes redirectAttrs) {
	     int isUpdated =c_repo.updateUserProfile(user);

	     if (isUpdated>0) {
	         redirectAttrs.addFlashAttribute("successMessage", "Profile updated successfully!");
	         return "redirect:/";
	     }
	     

	     redirectAttrs.addFlashAttribute("error", "Failed to update profile. Please try again.");
	     return "redirect:/profile";
	 }
	 @GetMapping("/deleteProfile")
	 public String deleteProfile(HttpSession session, RedirectAttributes redirectAttrs) {
	     Integer userId = (Integer) session.getAttribute("uID");

	     if (userId == null || userId == 0) {
	         redirectAttrs.addFlashAttribute("error", "Session expired or user not logged in.");
	         return "redirect:/login";
	     }

	     int isDeleted = c_repo.deleteUser(userId);

	     if (isDeleted>0) {
	         session.invalidate(); // Invalidate session after deletion
	         redirectAttrs.addFlashAttribute("successMessage", "Profile deleted successfully!");
	         return "redirect:/";
	     }

	     redirectAttrs.addFlashAttribute("error", "Failed to delete profile. Please try again.");
	     return "redirect:/changeProfile";
	 }

	 
}
