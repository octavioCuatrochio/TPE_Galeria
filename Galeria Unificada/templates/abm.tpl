{include file="head.tpl"}
{include file="header.tpl"}
{include file="asideMenu.tpl"}

{if $sesion}
    {include file="asideRegistrado.tpl"}
{else}
    {include file="asideRegistro.tpl"}
{/if}

<div class="abm_container">
    <h2> ¿Que quieres editar? </h2>

    <div class="abm_buttons">
        <button class="register_btn">
            <a href="artworkabm">
                Editar obras
            </a>
        </button>
        <button class="register_btn">
            <a href="categoryabm">
                Editar categorías
            </a>
        </button>
    </div>
</div>

{include file="footer.tpl"}