package mancheno.shop.controllers;

import mancheno.shop.entity.Category;
import mancheno.shop.entity.Comment;
import mancheno.shop.entity.User;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping(path = "/users")
public class UserController {
    @GetMapping
    public List<Category> list() {
        return Collections.emptyList();
    }

    @PostMapping
    public void create(@RequestBody User user) {

    }

    @GetMapping(path = "/{id}")
    public User getOne(@PathVariable int id) {
        return null;
    }

    @PostMapping(path = "/{id}")
    public void update(@PathVariable int id, @RequestBody User user) {

    }

    @DeleteMapping(path = "/{id}")
    public void remove(@PathVariable int id) {

    }
}