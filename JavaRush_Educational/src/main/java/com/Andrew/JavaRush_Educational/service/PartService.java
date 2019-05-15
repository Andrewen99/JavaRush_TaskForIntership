package com.Andrew.JavaRush_Educational.service;

import com.Andrew.JavaRush_Educational.domain.Part;
import com.Andrew.JavaRush_Educational.repo.PartRepo;
import com.sun.org.apache.xpath.internal.operations.Bool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class PartService {
    @Autowired
    private PartRepo partRepo;


    public boolean addPart(String name,String amount,String req){
        Part part1 = partRepo.findByName(name);
        if(part1!=null){
            return false;
        }

        boolean b = (req!=null);
        int am;
        try {
            am = Integer.parseInt(amount);
            partRepo.save(new Part(name,am,b));
        }catch (Exception e){
            return false;
        }
        return true;
    }

    public int computersAmount(List<Part> parts) {
        int min = Integer.MAX_VALUE;

        for (Part part : parts) {
            if (min > part.getAmount() && part.isRequirement())
                min = part.getAmount();
        }

        if (min == Integer.MAX_VALUE)
            return 0;
        else
            return min;

    }

    public Page<Part> partList(Pageable pageable, String nameFilter, String ayn) {
        System.out.println(nameFilter);
        if (nameFilter.length() > 0) {
            return partRepo.findByName(pageable, nameFilter);
        }
        if (ayn.equals("all")) {
            return partRepo.findAll(pageable);
        } if (ayn.equals("yes")) {
            return partRepo.findAllByRequirement(pageable, true );
        } if (ayn.equals("no")) {
            return partRepo.findAllByRequirement(pageable,false);
        }

        return partRepo.findAll(pageable);
    }

    public Part updatePart(String name, String amount, String isReq, Part part) {
        part.setName(name);
        part.setAmount(Integer.parseInt(amount));
        part.setRequirement(isReq!=null);
        partRepo.save(part);
        return part;
    }
}
