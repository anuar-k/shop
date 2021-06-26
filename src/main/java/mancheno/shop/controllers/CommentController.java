package mancheno.shop.controllers;

import mancheno.shop.entity.Category;
import mancheno.shop.entity.Comment;
import mancheno.shop.entity.Option;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;


@RestController
@RequestMapping(path = "/comments")
public class CommentController {

    @GetMapping
    public List<Category> list() {
        return Collections.emptyList();
    }

    @PostMapping
    public void create(@RequestBody Comment comment) {

    }

    @GetMapping(path = "/{id}")
    public Comment getOne(@PathVariable int id) {
        return null;
    }

    @PostMapping(path = "/{id}")
    public void update(@PathVariable int id, @RequestBody Comment comment) {

    }

    @DeleteMapping(path = "/{id}")
    public void remove(@PathVariable int id){

    }
}