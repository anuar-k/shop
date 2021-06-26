package mancheno.shop;

import mancheno.shop.controllers.response.PageDataResponse;
import mancheno.shop.entity.Category;
import mancheno.shop.repository.ProductRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

@RestController
@RequestMapping(path = "/test")
public class    TestController {

    ProductRepository productRepository;

    @GetMapping(path = "/first")
    public List<Category> first() {
        List<Category> list = new ArrayList<>();
//        list.add(new Category(11L, "Процессоры"));
//        list.add(new Category(12L, "Материнские платы"));
//        list.add(new Category(33L, "Смартфоны"));
//        Category c = new Category();
        return list;
    }

    @GetMapping(path = "/second")
    public void second(@RequestParam(name = "user_name") String name,
                       @RequestParam(name = "user_age", required = false) Integer age,
                       @RequestParam(name = "user_job", required = false) String job) {
        System.out.println(name);
        System.out.println(age);
        System.out.println(job);
    }

    @GetMapping(path = "/third/{id}")
    public void third(
            @PathVariable int id,
            @RequestParam String name
    ) {
        System.out.println(id);
        System.out.println(name);
        System.out.println();
    }

    @GetMapping(path = "/fourth/{login}/profile/{action}")
    public void fourth(
            @PathVariable String login,
            @PathVariable(required = false) String action
    ) {
        System.out.println(login);
        System.out.println(action);
    }


//    @GetMapping
//    public void test(
//            @RequestParam Long id,
//            @RequestParam S id,
//    ) {
//        System.out.println(login);
//        System.out.println(action);
//    }

    @GetMapping
    public PageDataResponse<String> pageTest(@RequestParam int page, @RequestParam int size) {
        List<String> strings = new ArrayList<>(Arrays.asList(
                "dog", "cat", "lion", "tiger", "cow", "fox", "last"
        ));

        int startPageItem = (page - 1) * size;
        int a = strings.size() / size;
        System.out.println(a);
//7/3 =2
        if (a < page) {
            return new PageDataResponse<>(new PageImpl<>(
                    strings.subList(startPageItem, strings.size()),
                    PageRequest.of(page, size),
                    strings.size()
            ));
        }

        return new PageDataResponse<>(new PageImpl<>(
                strings.subList(startPageItem, page * size),
                PageRequest.of(page, size),
                strings.size()


        ));

    }


}