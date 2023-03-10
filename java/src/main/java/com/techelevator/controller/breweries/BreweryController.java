package com.techelevator.controller.breweries;


import com.techelevator.dao.JdbcBeerDao;
import com.techelevator.dao.JdbcBreweryDao;
import com.techelevator.model.dto.BreweryDto;
import com.techelevator.model.app.Beer;
import com.techelevator.model.app.Brewery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.ResourceAccessException;
import org.springframework.web.server.ResponseStatusException;

import java.util.List;

@RestController
@RequestMapping("/breweries")
@CrossOrigin
public class BreweryController {
//endpoints may need to change in accordance with front end team design


    @Autowired
    JdbcTemplate jdbcTemplate;
    @Autowired
    JdbcBreweryDao breweriesDao;
    @Autowired
    JdbcBeerDao beerDao;

    /**
     * Gets a list of all breweries for display for the user on the breweries page
     * Author: Zach Everett
     */
    @ResponseStatus(HttpStatus.OK)
    @GetMapping()
    public List<Brewery> getListOfAllBreweries() {

        try {
            return breweriesDao.findAll();
        } catch (ResourceAccessException e) {
            System.out.println(e.getMessage());
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception f) {
            System.out.println(f.getMessage());
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/{id}")
    public Brewery getBreweryByID(@PathVariable int id ) {
        try {
            return breweriesDao.getBreweryById(id);
        }catch (ResourceAccessException e) {
            System.out.println(e.getMessage());
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        } catch (Exception f) {
            System.out.println(f.getMessage());
            throw new ResponseStatusException(HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/{breweryId}/beers")
    public List<Beer> getBeerByBreweryId(@PathVariable int breweryId){
        try{
            return beerDao.getByBreweryId(breweryId);
        }catch (ResponseStatusException re){
            re.getMessage();
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseStatus(HttpStatus.OK)
    @GetMapping("/manage/{brewerId}")
    public List<Brewery> getBreweryByBrewerId(@PathVariable int brewerId){
        try{
            return breweriesDao.findBreweryByBrewerId(brewerId);
        }catch (ResponseStatusException re){
            re.getMessage();
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }
    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/update/{breweryId}")
    public Brewery updateBrewery(@RequestBody BreweryDto brewery, @PathVariable int breweryId){
        try{
            Brewery updatedBrewery;
            updatedBrewery = breweriesDao.updateBrewery(brewery, breweryId);
            return updatedBrewery;
        }catch (ResponseStatusException re) {
            re.getMessage();
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST);
        }
    }

    //waiting on Danny for rest of methods.



}
