package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.spring.model.ProductBean;
import com.spring.model.category_bean;
import com.spring.repo.Product_Repo;

@Controller
public class Add_Category {
	@Autowired
	private Product_Repo pRepo;
	
	@GetMapping(value="category")
	public ModelAndView showCategory() {
		category_bean category=new category_bean();
		return new ModelAndView("add_category","CategoryObj",category);
	}
	
	
	@GetMapping(value="product")
	public ModelAndView showProduct(Model model) {
		ProductBean product=new ProductBean();
		 List<category_bean> categories = pRepo.getCategory();
		    if (categories != null && !categories.isEmpty()) {
		        model.addAttribute("cbeans", categories);
		    } else {
		        model.addAttribute("cbeans", new ArrayList<>()); 
		    }
		    return new ModelAndView("add_product","ProductObj",product);
	}
	
	

	
	@PostMapping(value="addCategory")
	public String addCategory(@ModelAttribute("CategoryObj")category_bean category,BindingResult br, Model m,RedirectAttributes re) throws SQLException {
		int categoryObj=pRepo.product_category(category);
		if(categoryObj>0) {
			 re.addFlashAttribute("successMessage", "Category added successfully!");
			return "redirect:/showCategory";
			
		}
		else {
			 re.addFlashAttribute("errorMessage", "Category Insert Failed!!!!");
			return "redirect:/category";
		}
	}
	
	
	 @PostMapping("/addProduct")
	    public String addProduct(@ModelAttribute("ProductObj") ProductBean productBean, Model model,RedirectAttributes redirectAttrs)
	            throws IllegalStateException, IOException, SQLException {

	        MultipartFile photo = productBean.getProduct_image();
	        if (photo == null || photo.isEmpty()) {
	            model.addAttribute("message", "No image uploaded!");
	            return "redirect:/product";
	        }

	        String uploadDir = "D:\\JWT\\ProjectWithTemplate\\src\\main\\webapp\\upload";
	        File uploadFolder = new File(uploadDir);
	        if (!uploadFolder.exists()) {
	            uploadFolder.mkdirs();
	        }

	        String fileName = photo.getOriginalFilename();
	        File dest = new File(uploadDir + File.separator + fileName);
	        photo.transferTo(dest);
	        productBean.setPhoto(fileName);


	        int result = pRepo.insert_product(productBean);
	        if (result > 0) {
	        	redirectAttrs.addFlashAttribute("ProductsuccessMessage", "Product added successfully!");
	            return "redirect:/showProduct";
	        } else {
	            model.addAttribute("message", "Error: Product upload failed.");
	            return "redirect:/product";
	        }
	    }
	    
	 @GetMapping(value = "/showProduct")
	 	public String showAlldProduct(Model map) {
	 		List<ProductBean> list = pRepo.getProduct();

	 		if (list.size() > 0) {
	 			map.addAttribute("productList", list);

	 		} else {
	 			map.addAttribute("error", "No Product");
	 		}
	 		return "view_product";
	 	}
	 
	 @GetMapping(value = "/showCategory")
	 	public String showAlldCategory(Model map) {
	 		List<category_bean> list = pRepo.getCategory();

	 		if (list.size() > 0) {
	 			map.addAttribute("categoryList", list);

	 		} else {
	 			map.addAttribute("error", "No Category");
	 		}
	 		return "view_category";
	 	}
	 
	 
	 @GetMapping("/addToCart")
	    public String showAddToCart(Model model, HttpSession session) {       
	        List<ProductBean> products = pRepo.getProduct();
	        model.addAttribute("productList", products);
	        return "show_user_product";
	    }
	 
	 @PostMapping("/addToCart/{id}")
     public String addToCart(@PathVariable("id") int id,
                             @RequestParam("quantity") int quantity,
                             HttpSession session,
                             Model model, RedirectAttributes redirectAttrs) {
         
         if (session.getAttribute("loggedInUser") == null) {
         	redirectAttrs.addFlashAttribute("warningMessage", "Please login to buy!");
             return "redirect:/login";
         }

         
         ProductBean product = pRepo.findProductById(id);
         if (product == null) {
             redirectAttrs.addFlashAttribute("error", "Product not found.");
             return "redirect:/productList";
         }

         
         List<ProductBean> cart = (List<ProductBean>) session.getAttribute("cartItems");
         Set<Integer> cartProductIds = (Set<Integer>) session.getAttribute("cartProductIds");

         if (cart == null) {
             cart = new ArrayList<>();
             session.setAttribute("cartItems", cart);
         }
         if (cartProductIds == null) {
             cartProductIds = new HashSet<>();
             session.setAttribute("cartProductIds", cartProductIds);
         }

         
         if (cartProductIds.contains(id)) {
             redirectAttrs.addFlashAttribute("error", "This product is already in your cart.");
             return "redirect:/addToCart";
         }

         
         if (quantity > product.getMaxQuantity()) {
             redirectAttrs.addFlashAttribute("error", "You cannot add more than " + product.getMaxQuantity() + " of " + product.getProduct_name());
             return "redirect:/addToCart";
         }

         product.setQuantity(quantity);
         cart.add(product);

         
         session.setAttribute("cartCount", cart.size());

         
         return "redirect:/addToCart";
     }
	 
	 
	 @GetMapping("/viewCart")
     public String viewCart(HttpSession session, Model model) {
         List<ProductBean> cartItems = (List<ProductBean>) session.getAttribute("cartItems");
         model.addAttribute("cartItems", cartItems);

         int totalPrice = 0;
         if (cartItems != null) {
             for (ProductBean item : cartItems) {
                 totalPrice += item.getPrice() * item.getQuantity();
             }
         }
         model.addAttribute("totalPrice", totalPrice);

         return "viewCart"; 
     }
	 
	 @PostMapping("/removeFromCart/{id}")
     public String removeFromCart(@PathVariable("id") int id, HttpSession session) {
         // Retrieve cart items and cart product IDs from the session
         List<ProductBean> cart = (List<ProductBean>) session.getAttribute("cartItems");
         Set<Integer> cartProductIds = (Set<Integer>) session.getAttribute("cartProductIds");

         if (cart != null && cartProductIds != null) {
             // Remove the product from the cart
             cart.removeIf(item -> item.getId() == id);
             
             // Remove the product ID from cartProductIds
             cartProductIds.remove(id);
             
             // Update the session attributes
             session.setAttribute("cartItems", cart);
             session.setAttribute("cartProductIds", cartProductIds);
             session.setAttribute("cartCount", cart.size());

             // Enable the "Add to Cart" button for this product by removing the "addedToCart_" attribute
             session.removeAttribute("addedToCart_" + id);
         }

         return "redirect:/viewCart";
     }
	 
	 @PostMapping("/updateCartQuantity/{id}")
     public String updateCartQuantity(@PathVariable("id") int productId,
                                       @RequestParam("quantity") int quantity,
                                       HttpSession session,
                                       Model model) {
         
         List<ProductBean> cart = (List<ProductBean>) session.getAttribute("cartItems");

         // Retrieve the product by ID
         ProductBean product = pRepo.findProductById(productId);

         // Check if the cart exists
         if (cart != null) {
             
             if (quantity > product.getMaxQuantity()) {
                 model.addAttribute("errorMessage",
                         "Requested quantity exceeds available stock for " + product.getProduct_name());
                 model.addAttribute("cartItems", pRepo.getCartItems()); 
                 return "viewCart"; 
             }

             
             for (ProductBean item : cart) {
                 if (item.getId() == productId) {
                     item.setQuantity(quantity);
                     break;
                 }
             }

             
             session.setAttribute("cartItems", cart);
             model.addAttribute("message", "Cart updated successfully!");
         } else {
             model.addAttribute("message", "Error: Cart not found.");
         }
         
         
         return "redirect:/viewCart";
     }
	 
	 @GetMapping("/search")
	    public String searchIngredients(@RequestParam("query") String query, ModelMap map) {
	        List<ProductBean> filteredproduct = pRepo.searchProductsByName(query);

	        if (filteredproduct.isEmpty()) {
	            map.addAttribute("message", "No ingredients found for your search: " + query);
	        } else {
	            map.addAttribute("products", filteredproduct);
	        }

	        return "redirect:/addToCart"; 
	    }
	 
}
