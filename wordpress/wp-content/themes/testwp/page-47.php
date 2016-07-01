<?php get_header(); ?>
<div class="header contact">
    <div class="wrapper">
        <div class="top clearfix">
            <div class="nav">
                <?php wp_nav_menu(); ?>
                <!--<ul>
                    <li><a href="#" class="active">Главная</a></li>
                    <li><a href="#">Галерея</a></li>
                    <li><a href="#">Контакты</a></li>
                </ul>-->
            </div>
            <div class="tel">
                <p><span><img src="<?php bloginfo("template_directory"); ?>/img/whatsapp.png" alt=""></span><span><img src="<?php echo get_template_directory_uri(); ?>/img/tel.png" alt=""></span>8 923 460 8362</p>
                <div style="clear: both;"></div>
                <p><span><img src="<?php bloginfo("template_directory"); ?>/img/whatsapp.png" alt=""></span><span><img src="<?php echo get_template_directory_uri(); ?>/img/tel.png" alt=""></span>8 950 574 2861</p>
            </div>
        </div>
        <div class="title">
            <h1><?php wp_title("",true); ?></h1>
        </div>
    </div>
</div>
<div class="form-contact clearfix">
    <h1>Задайте вопрос</h1>
    <p class="sub-text">или оставьте заявку на расчет</p>
    <div style="clear: both;"></div>
    <div class="left">
        <p class="bold">Телефон:</p>
        <p class="text">8 923 460 8362</p>
        <p class="bold">Whats'App/Viber:</p>
        <p class="text">8 923 460 8362</p>
        <p class="bold">E-mail:</p>
        <p class="text">csfsadasd@mail.ru</p>
        <p class="bold">Звоните:</p>
        <p class="text">ежедневно 8:00-20:00 (мск)</p>
    </div>
    <div class="right-form">
        <form action="#">
            <div class="left-b">
                <input type="text" placeholder="Ваше Имя">
                <input type="text" placeholder="Ваш телефон">
                <div class="input clearfix">
                    <input type="text" placeholder="Размер">
                    <input type="text" placeholder="Вес">
                </div>
                <div class="photo clearfix">
                    <ul>
                        <li><a href="#"><img src="img/photo2.png" alt=""></a></li>
                        <li><a href="#"><img src="img/photo2.png" alt=""></a></li>
                        <li><a href="#"><img src="img/photo2.png" alt=""></a></li>
                        <li><a href="#"><img src="img/photo2.png" alt=""></a></li>
                    </ul>
                </div>
            </div>
            <div class="right-b">
                <textarea name="" id="" cols="30" rows="10"></textarea>
                <input type="submit" class="submit" value="Рассчитать">
            </div>
        </form>
    </div>
</div>
<?php get_footer(); ?>
