%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a class="logo">
      <span class="logo-lg"><b>EasyLXC</b></span>
    </a>
  </header>
  <aside class="main-sidebar">
    <section class="sidebar">
      <ul class="sidebar-menu" data-widget="tree">
	<li class="header">UPTIME</li>
	<li class="treeview">
	  <a href="/">
	    <i class="fa fa-arrow-up"></i> <span>{{ uptime }}</span>
	  </a>
	</li>
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="treeview">
          <a href="/">
	    <i class="fa fa-window-maximize"></i>Página principal</a>
	  </a>
        </li>
	</a>
	<li class="active treeview">
          <a href="/contenedores">
            <i class="fa fa fa-cubes"></i><span>Contenedores</span>
          </a>
        </li>
	<li class="treeview">
                <li><a href="/snapshots"><i class="fa fa-camera-retro"></i>Snapshots</a></li>
        </li>
	<li class="treeview">
	  <li><a href="/monitor"><i class="fa fa-dashboard"></i>Monitorización de Ping</a></li>
	</li>
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Información de <strong>{{ name }}</strong>
      </h1>
      <ol class="breadcrumb">
	<li><a href="/"><i class="fa fa-window-maximize"></i>Home</a></li>
        <li><a href="#"><i class="fa fa-cubes"></i>Contenedores</a></li>
        <li class="active">Información del contenedor<li>
      </ol>
    </section>
    <section class="content">
      {{ info }}
    </section>
  </div>
%include('foot.tpl')
