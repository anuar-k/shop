package mancheno.shop.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "ratings")
public @Data
class Rating {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "product_id")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private Integer rate;
}