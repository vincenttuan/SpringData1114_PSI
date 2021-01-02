package com.spring.mvc.psi.controller;

import com.spring.mvc.psi.entities.Product;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/psi")
public class PSIController {
    
    @GetMapping(value = {"/product"})
    public String readProduct(Model model) {
        Product product = new Product();
        model.addAttribute("product", product);
        return "product";
    }
    
}
