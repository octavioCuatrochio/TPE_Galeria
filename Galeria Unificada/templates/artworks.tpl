{include file="head.tpl"}
{include file="header.tpl"}
{include file="asideMenu.tpl"}
{include file="asideRegistro.tpl"}

<form action="search" method="post">
    <div class="search_container">
        <label>Elija una categoría:</label>
        <div class="search_category">
            <select name="category">
                {foreach from=$categorias item=categoria}
                    <option value="{$categoria->id}">{$categoria->nombre}</option>
                {/foreach}
            </select>
            <button class="register_btn_nomargin" type="submit">Consultar</button>
        </div>
    </div>
</form>

<button>
    <a class="register_btn_nomargin link_remover" href="categories">Mostrar categorías</a>
</button>

<article class="artworks_container">

    <table>
        <thead>
            <tr>
                <th>Nombre</th>
                <th>Autor</th>
                <th>Categoria</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$obras item=obra}
                <tr>
                    <td>
                        <h2>{$obra->nombre}</h2>
                    </td>
                    <td>
                        <h3>{$obra->autor}</h3>
                    </td>
    
                    <td>
                        {if $obra->id_categoria eq 1}
                            <h4> Pintura </h4>
                        {/if}
                        {if $obra->id_categoria eq 2}
                            <h4> Dibujo </h4>
                        {/if}
                        {if $obra->id_categoria eq 3}
                            <h4> Escultura </h4>
                        {/if}
                    </td>
                    <td class="register_btn">
                        <a class="link_remover" href="details/{$obra->id}">Detalles</a>
                    </td>
                </tr>
            {/foreach}
        </tbody>
    </table>


    {include file="footer.tpl"}