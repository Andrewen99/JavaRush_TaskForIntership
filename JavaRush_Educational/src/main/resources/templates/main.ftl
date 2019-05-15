<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <title>Task1</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

</head>
<body>
<div class="container mt-5">
    <div class="row"></div>
    <div class="col">
        <div class="alert alert-info" role="alert">
            <h2> Комплектующие для компьютера</h2>
        </div>

    </div>

    <form method="post">
        <div class="form-group">
            <label for="ComputerPart">Наименование комплектующего</label>
            <input type="text" class="form-control"
                   name="name" placeholder="Введите наименование комплектующего:"/>
        </div>
        <div class="form-group">
            <label for="ComputerAmount">Количество</label>
            <input type="text" class="form-control"
                   value="" name="amount" placeholder="Введите количество комплектующего: " />
        </div>
        <div class="form-group form-check">
            <input type="checkbox" class="form-check-input" id="exampleCheck1" name="isReq" value="req">
            <label class="form-check-label" for="inlineCheckbox1">Необходимость</label>
        </div>
        <button type="submit" class="btn btn-primary mb-3">Добавить деталь</button>

    </form>

    <form class="form-inline">
        <div class="form-group mb-3">
            <label for="staticEmail2" class="sr-only">Email</label>
            <input type="text" readonly class="form-control-plaintext" id="staticEmail2" value="Поиск по названию">
        </div>
        <div class="form-group mx-sm-3 mb-2">
            <label for="inputPassword2" class="sr-only">Введите название комплектующего:</label>
            <input  name="nameFilter" type="text" class="form-control" id="inputPassword2" placeholder="Введите название:">
        </div>
        <button type="submit" class="btn btn-primary mb-2">Поиск</button>
    </form>

    <form merhod = "get" action="/" >
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="all" <#if radio=="all">checked</#if>>
            <label class="form-check-label" for="inlineRadio1">Все</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="yes" <#if radio=="yes">checked</#if>>
            <label class="form-check-label" for="inlineRadio2">Необходимые</label>
        </div>
        <div class="form-check form-check-inline">
            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="no" <#if radio=="no">checked</#if>>
            <label class="form-check-label" for="inlineRadio3">Опциональные</label>
        </div>
        <button type="submit" class="btn btn-primary mb-3">Сортировка таблицы</button>

    </form>


    <div class="row"></div>

    <div class="col">
        <ul class="list-group list-group-flush">
            <li class="list-group-item ">
                <div class="container">
                    <div class="row">
                        <div class="col">
                            Наименование
                        </div>
                        <div class="col">
                            Необходимость
                        </div>
                        <div class="col">
                            Количество
                        </div>
                        <div class="col">

                        </div>
                    </div>
                </div>
            </li>


    <#list parts.content as part>



    <li class="list-group-item ">
        <div class="container">
            <div class="row">
                <div class="col">
                    <p><a href="/${part.id}">${part.name}</a></p>
                </div>
                <div class="col">
                    <span class="text-dark"><#if part.requirement>Да<#else>Нет</#if></span>
                </div>
                <div class="col">
                    <span class="text-secondary">${part.amount}</span>
                </div>
                <div class="col">
                    <form method="post" action="/" class="form-inline">
                        <input type="hidden" name="id" value="${part.id}" />
                        <button class="btn btn-light ml-3"  role="button">Удалить</button>

                    </form>
                </div>
            </div>
        </div>
    </li>

    </#list>

        </ul>

        <#if parts.getTotalPages() gt 7>
            <#assign
            totalPages=page.getTotalPages()
            pageNumber  = page.getNumber() + 1

            head=(pageNumber>4)?then([1,-1],[1,2,3])
            tail=(pageNumber < totalPages -3)?then([-1,totalPages],[totalPages-2,totalPages-1,totalPages])
            bodyBefore = (pageNumber > 4 && pageNumber<totalPages-3)?then([pageNumber-2,pageNumber-1],[])
            bodyAfter = (pageNumber > 2 && pageNumber < totalPages-3)?then([pageNumber+1,pageNumber+2],[])


            body=head + bodyBefore + (pageNumber > 3 &&pageNumber < totalPages-2)?then([pageNumber],[]) + bodyAfter + tail
            >


        <#else >
            <#assign body=1..parts.getTotalPages()>

        </#if>
        <div class="container mt-3">
            <div class="row">
                <ul class="pagination col justify-content">
                    <li class="page-item disabled">
                        <a class="page-link" href="#" tabindex="-1">Страницы</a>
                    </li>
            <#list body as p>
                <#if (p-1)==parts.getNumber()>
            <li class="page-item active">
                <a class="page-link" href="#" tabindex="-1">${p}</a>
            </li>
                <#elseif p==-1>
            <li class="page-item disabled">
                <a class="page-link" href="#" tabindex="-1">...</a>
            </li>
                <#else>
            <li class="page-item">
                <a class="page-link" href="${url}?inlineRadioOptions=${radio}&page=${p-1}&size=${parts.getSize()}" tabindex="-1">${p}</a>
            </li>
                </#if>
            </#list>
                </ul>


            </div>

        </div>
    </div>
















    <div class="row"></div>
    <div class="col"><h2 class="alert alert-primary mt-16" role="alert">Можно собрать ${compAmount} компьютеров</h2></div>

</div>







<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>


</body>
</html>