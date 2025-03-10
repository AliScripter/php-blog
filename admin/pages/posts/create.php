<?php
include "../../include/layout/header.php";

$categories = $db->query("SELECT * FROM categories ;");

// ! Define Variables
$invalidInputTitle = null;
$invalidInputAuthor = null;
$invalidInputImage = null;
$invalidInputBody = null;

// ! Validation Inputs
if (isset($_POST['addPost'])) {

    if (empty(trim($_POST['title']))) {
        $invalidInputTitle = 'فیلد عنوان مقاله الزامیست';
    }
    if (empty(trim($_POST['author']))) {
        $invalidInputAuthor = 'فیلد نویسنده مقاله الزامیست';
    }
    if (empty(trim($_FILES['image']['name']))) {
        $invalidInputImage = 'فیلد تصویر مقاله الزامیست';
    }
    if (empty(trim($_POST['body']))) {
        $invalidInputBody = 'فیلد متن مقاله الزامیست';
    }
}

// ! Check for post to DB
if (
    !empty(trim($_POST['title'])) &&
    !empty(trim($_POST['author'])) &&
    !empty(trim($_FILES['image']['name'])) &&
    !empty(trim($_POST['body']))
) {
    $title = $_POST['title'];
    $author = $_POST['author'];
    $body = $_POST['body'];
    $categoryId = $_POST['categoryId'];

    $tempName = $_FILES['image']['tmp_name'];
    $imageName = time() . "_" .  $_FILES['image']['name'];
    if (move_uploaded_file($tempName, "../../../uploads/posts/$imageName")) {
        $postInsert =  $db->prepare("INSERT INTO posts (title,body,category_id,author,image) VALUES (:title , :body , :category_id , :author , :image);");

        $postInsert->execute(['title' => $title, 'body' => $body, 'category_id' => $categoryId, 'author' => $author, 'image' => $imageName]);

        header("Location:index.php");
        exit();
    } else {
        print "Upload Failed , Try Again Later";
    }
}
?>

<div class="container-fluid">
    <div class="row">
        <!-- Sidebar Section -->
        <?php
        include "../../include/layout/sidebar.php";
        ?>

        <!-- Main Section -->
        <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
            <div
                class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
                <h1 class="fs-3 fw-bold">ایجاد مقاله</h1>
            </div>

            <!--Create New Post -->
            <div class="mt-4">
                <form class="row g-4" method="POST" enctype="multipart/form-data">
                    <div class="col-12 col-sm-6 col-md-4">
                        <label class="form-label">عنوان مقاله</label>
                        <input type="text" name="title" class="form-control" />
                        <div class="form-text text-danger">
                            <?= $invalidInputTitle ?>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4">
                        <label class="form-label">نویسنده مقاله</label>
                        <input type="text" name="author" class="form-control" />
                        <div class="form-text text-danger">
                            <?= $invalidInputAuthor ?>
                        </div>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4">
                        <label class="form-label">دسته بندی مقاله</label>
                        <select class="form-select" name="categoryId">
                            <?php if ($categories->rowCount() > 0) : ?>
                                <?php foreach ($categories as $category) : ?>
                                    <option value="<?= $category['id'] ?>"><?= $category['title'] ?></option>
                                <?php endforeach ?>
                            <?php endif ?>
                        </select>
                    </div>

                    <div class="col-12 col-sm-6 col-md-4">
                        <label for="formFile" class="form-label">تصویر مقاله</label>
                        <input class="form-control" type="file" name="image" />
                        <div class="form-text text-danger">
                            <?= $invalidInputImage ?>
                        </div>
                    </div>

                    <div class="col-12">
                        <label for="formFile" class="form-label">متن مقاله</label>
                        <div class="form-text text-danger">
                            <?= $invalidInputBody ?>
                        </div>
                        <textarea
                            class="form-control"
                            rows="6" name="body">
                        </textarea>

                    </div>

                    <div class="col-12">
                        <button type="submit" class="btn btn-dark" name="addPost">
                            ایجاد
                        </button>
                    </div>
                </form>
            </div>
        </main>
    </div>
</div>
<?php
include "../../include/layout/footer.php";
?>