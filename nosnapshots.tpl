%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="/inicio" class="logo">
      <span class="logo-lg"><img src="/static/images/logo.png"></span>
    </a>
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
        <li class="treeview">
          <a href="/">
	    <i class="fa fa-window-maximize"></i>Pagina Principal</a>
	  </a>
        </li>
	</a>
        <li class="treeview">
                <li><a href="/contenedores"><i class="fa fa-cubes"></i>Contenedores</a></li>
        </li>
	<li class="active treeview">
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
        Snapshots del contenedor <strong>{{ name }}</strong>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Principal</li>
      </ol>
    </section>
    <section class="content">
      <div>
	<div class="alert alert-info alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
          <h4><i class="icon fa fa-info"></i> Atención</h4>
          {{ sinsnap }}
        </div>
      </br>
      <a class="btn btn-primary btn-flat pull-right" display="inline-block" href="/formcrearsnapshot/{{ name }}"><i aria-hidden="true"></i>
  Nueva Snapshot</a>
    </section>
  </div>
</script>
%include('foot.tpl')
