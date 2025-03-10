<?php
include "./include/layout/header.php";

if (isset($_GET['post'])) {
    $postId = $_GET['post'];
    $post = $db->prepare("SELECT * FROM posts WHERE id = :id ;");

    $post->execute(['id' => $postId]);
    $post = $post->fetch();
}
?>

<main>
    <!-- Content -->
    <section class="mt-4">
        <div class="row">
            <!-- Posts & Comments Content -->
            <?php if (empty($post)) : ?>
                <div class="col-lg-8">
                    <div class="alert alert-danger">
                        <h3>
                            مقاله ای یافت نشد
                        </h3>
                    </div>
                </div>

            <?php else : ?>
                <div class="col-lg-8">
                    <div class="row justify-content-center">

                        <?php
                        $categoryId = $post['category_id'];
                        $postCategory = $db->query("SELECT * FROM categories WHERE id = $categoryId")->fetch();
                        ?>
                        <!-- Post Section -->
                        <div class="col">
                            <div class="card">
                                <img
                                    src="../uploads/posts/<?= $post['image'] ?>"
                                    class="card-img-top"
                                    alt="post-image" />
                                <div class="card-body">
                                    <div
                                        class="d-flex justify-content-between">
                                        <h5 class="card-title fw-bold">
                                            <?= $postCategory['title'] ?>
                                        </h5>
                                        <div>
                                            <span
                                                class="badge text-bg-secondary">
                                                <?= $postCategory['title'] ?>
                                            </span>
                                        </div>
                                    </div>
                                    <p
                                        class="card-text text-secondary text-justify pt-3">
                                        <?= $post['body'] ?>
                                    </p>
                                    <div>
                                        <p class="fs-6 mt-5 mb-0">
                                            نویسنده : <?= $post['author'] ?>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr class="mt-4" />

                        <!-- Comment Section -->
                        <div class="col">
                            <?php
                            $invalidInputName = null;
                            $invalidInputComment = null;
                            $message = null;

                            if (isset($_POST['sendComment'])) {
                                if (empty(trim($_POST['name']))) {
                                    $invalidInputName = "فیلد نام الزامیست";
                                } else if (empty(trim($_POST['comment']))) {
                                    $invalidInputComment = "فیلد کامنت الزامیست";
                                } else {
                                    $name = $_POST['name'];
                                    $comment = $_POST['comment'];

                                    $newComment =  $db->prepare("INSERT INTO comments (name , comment , post_id ) VALUES (:name , :comment , :post_id ) ;");

                                    $newComment->execute(['name' => $name, 'comment' => $comment, 'post_id' => $postId]);

                                    $message = "کامنت شما با موفقیت ثبت شد و پس از تایید نمایش داده می‌شود";
                                }
                            }
                            ?>
                            <!-- Comment Form -->
                            <div class="card">
                                <div class="card-body">
                                    <p class="fw-bold fs-5">
                                        ارسال کامنت
                                    </p>
                                    <div class="text-success">
                                        <?= $message ?>
                                    </div>
                                    <form method="POST">
                                        <div class="mb-3">
                                            <label class="form-label">نام</label>
                                            <input
                                                type="text"
                                                name="name"
                                                class="form-control" />
                                            <div class="form-text text-danger">
                                                <?= $invalidInputName ?>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label class="form-label">متن کامنت</label>
                                            <textarea
                                                name="comment"
                                                class="form-control"
                                                rows="3"></textarea>
                                            <div class="form-text text-danger">
                                                <?= $invalidInputComment ?>
                                            </div>
                                        </div>
                                        <button
                                            type="submit"
                                            name="sendComment"
                                            class="btn btn-dark">
                                            ارسال
                                        </button>
                                    </form>
                                </div>
                            </div>
                            <hr class="mt-4" />
                            <!-- Comment Content -->
                            <?php
                            $comments = $db->prepare("SELECT * FROM comments WHERE post_id = :id AND status = 1 ;");
                            $comments->execute(['id' => $postId])
                            ?>

                            <p class="fw-bold fs-6">تعداد کامنت : <?= $comments->rowCount() ?> </p>

                            <?php if ($comments->rowCount() > 0) : ?>
                                <?php foreach ($comments as $comment) : ?>
                                    <div class="card bg-light-subtle mb-3">
                                        <div class="card-body">
                                            <div
                                                class="d-flex align-items-center">
                                                <img
                                                    src="./assets/images/profile.png"
                                                    width="45"
                                                    height="45"
                                                    alt="user-profle" />

                                                <h5
                                                    class="card-title me-2 mb-0">
                                                    <?= $comment['name'] ?>
                                                </h5>
                                            </div>

                                            <p class="card-text pt-3 pr-3">
                                                <?= $comment['comment'] ?>
                                            </p>
                                        </div>
                                    </div>
                                <?php endforeach ?>
                            <?php else : ?>
                                <div class="alert alert-success" role="alert">
                                    <h5>
                                        اولین نفری باشید که نظر می‌دهید
                                    </h5>
                                </div>
                            <?php endif ?>
                        </div>
                    </div>
                </div>
            <?php endif ?>
            <!-- Sidebar Section -->
            <?php
            include "./include/layout/sidebar.php";
            ?>
        </div>
    </section>
</main>

<?php
include "./include/layout/footer.php";
?>