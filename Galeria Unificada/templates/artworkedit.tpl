{include file="headdeeply.tpl"}
{include file="header.tpl"}
{include file="asideMenu.tpl"}
{include file="asideRegistrado.tpl"}

<h1> Editar obra </h1>

<div class="abm_edit_container">
    <form action="addeditedartwork/{$obra->id}" method="post">

        <div class="abm_edit_row">

            <div class="input_block">
                <label>Nombre:</label>
                <input name="nombre" type="text" placeholder="{$obra->nombre}...">
            </div>

            <div class="input_block">
                <label>Descripcion:</label>
                <input type="text" name="descripcion" placeholder="{$obra->descripcion}...">
            </div>
        </div>

        <div class="abm_edit_row">

            <div class="input_block">
                <label>Autor:</label>
                <input name="autor" type="text" placeholder="{$obra->autor}...">
            </div>

            <div class="input_block">
                <label>Año:</label>
                <input name="anio" type="date" placeholder="{$obra->anio}...">
            </div>
        </div>

        <div class="abm_edit_row">

            <div class="input_block">

                <label>Imagen (link):</label>
                <input name="imagen" type="url" placeholder="Imagen...">
            </div>

            <div class="input_block">
                <label>Categoría:</label>
                <select name="category">
                    {foreach from=$categorias item=categoria}
                        <option value="{$categoria->id}">{$categoria->nombre}</option>
                    {/foreach}
                </select>

            </div>
        </div>

        </form>
        <button class="register_btn_nomargin" type="submit">Terminar edición</button>
</div>

{include file="footer.tpl"}