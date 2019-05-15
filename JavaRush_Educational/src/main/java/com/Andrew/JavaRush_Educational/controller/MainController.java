package com.Andrew.JavaRush_Educational.controller;

import com.Andrew.JavaRush_Educational.domain.Part;
import com.Andrew.JavaRush_Educational.repo.PartRepo;
import com.Andrew.JavaRush_Educational.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private PartRepo partRepo;
    @Autowired
    private PartService partService;


    @GetMapping("/")
    public String showMainPage(
            @RequestParam(required = false, defaultValue = "") String nameFilter,
            @RequestParam(value = "inlineRadioOptions", required = false, defaultValue = "all") String radBut,
            @PageableDefault(sort={"id"},direction = Sort.Direction.DESC) Pageable pageable,
            Model model
            ) {
        Page<Part> parts = partService.partList(pageable,nameFilter, radBut);
        model.addAttribute("url","/");
        model.addAttribute("parts", parts);
        model.addAttribute("compAmount", partService.computersAmount(partRepo.findAll()));
        model.addAttribute("radio", radBut);
        return "main";
    }

    @GetMapping("/{part}")
    public String edit(
            @PathVariable Part part,
            Model model
    ) {
        model.addAttribute("part",part);
        return "editor";
    }

    @PostMapping("/{part}")
    public String save(
            @PathVariable Part part,
            @RequestParam String name,
            @RequestParam String amount,
            @RequestParam(value = "isReq", required = false) String isReq,
            @PageableDefault(sort={"id"},direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ) {
        part = partService.updatePart(name, amount, isReq, part);
        model.addAttribute("part",part);
        return "redirect:/";
    }

    @PostMapping(name = "/", params = {"name", "amount"})
    public String addElement(
            @RequestParam String name,
            @RequestParam String amount,
            @RequestParam(value = "isReq", required = false) String isReq,
            @RequestParam(value = "inlineRadioOptions", required = false, defaultValue = "all") String radBut,
            @RequestParam(required = false, defaultValue = "") String nameFilter,
            @PageableDefault(sort={"id"},direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ) {
        partService.addPart(name, amount, isReq);
        Page<Part> parts = partService.partList(pageable,nameFilter,radBut);
        model.addAttribute("url","/");
        model.addAttribute("parts", parts);
        model.addAttribute("compAmount", partService.computersAmount(partRepo.findAll()));
        model.addAttribute("radio", radBut);
        return "main";

    }

    @PostMapping(name = "/", params = {"id"})
    public String delete(
            @RequestParam Long id,
            @RequestParam(value = "inlineRadioOptions", required = false, defaultValue = "all") String radBut,
            @RequestParam(required = false, defaultValue = "") String nameFilter,
            @PageableDefault(sort={"id"},direction = Sort.Direction.DESC) Pageable pageable,
            Model model
    ) {
        partRepo.deleteById(id);
        Page<Part> parts = partService.partList(pageable, nameFilter, radBut);
        model.addAttribute("url","/");
        model.addAttribute("parts", parts);
        model.addAttribute("compAmount", partService.computersAmount(partRepo.findAll()));
        model.addAttribute("radio", radBut);
        return "main";
    }


}
