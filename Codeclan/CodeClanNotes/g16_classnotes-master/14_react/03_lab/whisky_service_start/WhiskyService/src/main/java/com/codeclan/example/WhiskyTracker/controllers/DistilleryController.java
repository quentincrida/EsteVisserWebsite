package com.codeclan.example.WhiskyTracker.controllers;

import com.codeclan.example.WhiskyTracker.models.Distillery;
import com.codeclan.example.WhiskyTracker.repositories.DistilleryRepository.DistilleryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
public class DistilleryController {

    @Autowired
    DistilleryRepository distilleryRepository;

    @GetMapping(value = "/distilleries")
    public ResponseEntity<List<Distillery>> getAllDistilleries(){
        return new ResponseEntity<>(distilleryRepository.findAll(), HttpStatus.OK);
    }

    @GetMapping(value = "/distilleries/{id}")
    public ResponseEntity getDistilleries(@PathVariable Long id){
        return new ResponseEntity<>(distilleryRepository.findById(id), HttpStatus.OK);
    }

    @PostMapping(value = "/distilleries")
    public ResponseEntity<Distillery> postDistilleries(@RequestBody Distillery distillery){
        distilleryRepository.save(distillery);
        return new ResponseEntity<>(distillery, HttpStatus.CREATED);
    }

    @PatchMapping(value = "/distilleries/{id}")
    public ResponseEntity<Distillery> updateDistilleries(@RequestBody Distillery distillery){
        distilleryRepository.save(distillery);
        return new ResponseEntity<>(distillery, HttpStatus.OK);
    }

    @DeleteMapping(value = "/distilleries/{id}")
    public ResponseEntity<Distillery> deleteDistilleries(@PathVariable Long id) {
        Distillery found = distilleryRepository.getOne(id);
        distilleryRepository.delete(found);
        return new ResponseEntity<>(null, HttpStatus.OK);
    }


}
