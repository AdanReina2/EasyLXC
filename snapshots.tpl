%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="/inicio" class="logo">
      <span class="logo-lg"><img src="/static/images/logo.png"></span>
    </a>
    <nav class="navbar navbar-static-top">
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <img src="/static/dist/img/user.png" class="user-image" alt="User Image">
              <span class="hidden-xs">{{user}}</span>
            </a>
            <ul class="dropdown-menu">
              <li class="user-header">
                <img src="static/dist/img/user.png" class="img-circle" alt="User Image">
                <p>
                  Bienvenido, {{user}}
                </p>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
	<li class="header">UPTIME</li>
	<li class="treeview">
	  <a href="/inicio">
	    <i class="fa fa-arrow-up"></i> <span>{{ uptime }}</span>
	  </a>
	</li>
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="active treeview">
          <a href="/inicio">
	    <i class="fa fa-window-maximize"></i>Pagina Principal</a>
	  </a>
        </li>
	</a>
        <li class="treeview">
                <li><a href="/contenedores"><i class="fa fa-cubes"></i>Contenedores</a></li>
        </li>
	<li class="treeview">
                <li><a href="/snapshots"><i class="fa fa-camera-retro"></i>Snapshots</a></li>
        </li>
        <li class="treeview">
        	<li><a href="/graficas"><i class="fa fa-pie-chart"></i>Gráficas</a></li>
        </li>
        <li class="treeview">
        	<li><a href="/redes"><i class="fa fa-edit"></i>Redes</a></li>
        </li>
        <li class="header">ALERTAS</li>
        <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Criticas</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-red">1</small>
          </span>
        </a></li>
        <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Importantes</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-yellow">1</small>
          </span>
        </a></li>
        <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Informativas</span>
          <span class="pull-right-container">
            <small class="label pull-right bg-blue">1</small>
          </span>
        </a></li>
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Snapshots
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Principal</li>
      </ol>
    </section>
    <section class="content">
      <select class="form-control select2" style="width: 100%;">
        <option selected="selected">Alabama</option>
        <option>Alaska</option>
        <option>California</option>
        <option>Delaware</option>
        <option>Tennessee</option>
        <option>Texas</option>
        <option>Washington</option>
      </select>
      </br>
      <button type="submit" class="btn btn-primary btn-flat pull-right" >Listar Snapshots</button>
      </br>
      </br>
      </br>
      <div class="callout callout-danger">
        <h4>No se ha seleccionado ningún contenedor</h4>
        Debe seleccionar un contenedores para mostrar las snapshots asociadas
      </div>
    </section>
  </div>
</script>
%include('foot.tpl')
