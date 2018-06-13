%include('header.tpl')
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <a href="index2.html" class="logo">
      <span class="logo-lg"><img src="/static/images/logo.png"></span>
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
      </ul>      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENÚ</li>
        <li class="treeview">
        	<li><a href="/"><i class="fa fa-window-maximize"></i>Página principal</a><li>
        </li>
        <li class="treeview">
          <a href="/contenedores">
            <i class="fa fa-cubes"></i> <span>Contenedores</span>
          </a>
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
        Seleccionar máquina para ver su monitorización
      </h1>
      <ol class="breadcrumb">
        <li><a href="/"><i class="fa fa-window-maximize"></i>Home</a></li>
        <li><a href="#"><i class="fa fa-dashboard"></i>Monitorización</a></li>
      </ol>
    </section>
    <section class="content">
      <div class="box box-primary">
            <div class="box-body">
              <form action="/monitor2" method="post">
		<select class="form-control select2" style="width: 100%;" name="opcion">
		  % for i in xrange(lenlista):
                    <option>{{ lista[i] }}</option>
		  % end
                </select>
		</br>
                <input class="btn btn-primary btn-flat pull-right" display="inline-block" type="submit" value="Ver monitorización">
              </form>
            </div>
      </div>
    </section>
  </div>
%include('foot.tpl')
