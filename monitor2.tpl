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
                <li><a href="/"><i class="fa fa-window-maximize"></i>Página principal</a><li>
        </li>
	</a>
        <li class="treeview">
                <li><a href="/contenedores"><i class="fa fa-cubes"></i>Contenedores</a></li>
        </li>
	<li class="treeview">
                <li><a href="/snapshots"><i class="fa fa-camera-retro"></i>Snapshots</a></li>
        </li>
	<li class="active treeview">
          <a href="/monitor">
            <i class="fa fa fa-dashboard"></i><span>Monitorización de Ping</span>
          </a>
        </li>
      </ul>
    </section>
  </aside>
  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        Monitorización del contenedor <strong>{{ name }}</strong>
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Monitorización</li>
      </ol>
    </section>
    <section class="content">
      <h2>
        Ping
      </h2>
      <div class="callout callout-info">
	% if ip == "":
	  <h4>No tiene IP</h4>
	% else:
          <h4>Ping hacia {{ ip }}</h4>
	% end
	% for i in xrange(lenlisping):
          <p>{{ lisping[i] }}</p>
	% end
      </div>
    </section>
  </div>
</script>
%include('foot.tpl')
