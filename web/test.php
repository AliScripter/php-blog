<?php
// این یک کپی از راه حل قسمت 61 بود برای صفحه ایندکس 
include "./include/layout/header.php";

$posts = $db->query("SELECT * FROM posts ORDER BY id DESC ;");
$posts_data = $posts->fetchAll();

?>

<main>
    <?php
    include "./include/layout/slider.php"
    ?>
    <!-- Content Section -->
    <section class="mt-4">

        <div class="row">
            <!-- Posts Content -->
            <div class="col-lg-8">
                <div class="row g-3">

                    <?php if (count($posts_data) > 0) : ?>
                        <?php foreach ($posts_data as $post) : ?>
                            <?php
                            $post_category = $post['category_id'];
                            $search_cat = $db->query("SELECT * FROM  categories WHERE id = $post_category ;");
                            $final_cat = $search_cat->fetchAll();
                            ?>
                            <!-- Single Post -->
                            <div class="col-sm-6">
                                <div class="card h-100">
                                    <img
                                        src="./uploads/posts/<?= $post['image'] ?>"
                                        class="card-img-top"
                                        alt="post-image" />
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between">
                                            <h5 class="card-title fw-bold">
                                                <?= $post['title'] ?>
                                            </h5>
                                            <div>
                                                <span class="badge text-bg-secondary">
                                                    <?= $final_cat[0]['title'] ?>
                                                </span>
                                            </div>
                                        </div>
                                        <p class="card-text text-secondary pt-3">
                                            <?= substr($post['body'], 0, 200) ?>
                                        </p>
                                        <div
                                            class="d-flex justify-content-between align-items-center">
                                            <a href="single.html" class="btn btn-sm btn-dark">مشاهده</a>

                                            <p class="fs-7 mb-0">نویسنده : <?= $post['author'] ?> </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        <?php endforeach ?>
                        <div class="col">
                            <div class="alert alert-danger">
                                <h3>
                                    مقاله ای یافت نشد
                                </h3>
                            </div>
                        </div>
                    <?php endif ?>
                </div>
            </div>

            <?php
            include "./include/layout/sidebar.php";
            ?>

        </div>

    </section>
</main>

<?php
include "./include/layout/footer.php";
?>

<style>
    .card img {
        height: 200px;
        object-fit: cover;
        object-position: center center;
        overflow: hidden;
    }
</style>