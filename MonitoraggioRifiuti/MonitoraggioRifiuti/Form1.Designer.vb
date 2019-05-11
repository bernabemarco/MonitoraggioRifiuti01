<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form esegue l'override del metodo Dispose per pulire l'elenco dei componenti.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Richiesto da Progettazione Windows Form
    Private components As System.ComponentModel.IContainer

    'NOTA: la procedura che segue è richiesta da Progettazione Windows Form
    'Può essere modificata in Progettazione Windows Form.  
    'Non modificarla mediante l'editor del codice.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.Biri_MonitoraggioRifiutiBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Biri_MonitoraggioRifiutiTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.Codici_CERTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.Codici_CERTableAdapter()
        Me.EXTRATESTERIFIUTITableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter()
        Me.Biri_MonitoraggioRifiutiBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.Biri_MonitoraggioRifiutiDataGridView = New System.Windows.Forms.DataGridView()
        Me.EXTRATESTERIFIUTIBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.EXTRATESTERIFIUTIDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn17 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn18 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn20 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.TipoCer = New System.Windows.Forms.DataGridViewComboBoxColumn()
        Me.CodiciCERBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DataGridViewTextBoxColumn21 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewCheckBoxColumn1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.DataGridViewTextBoxColumn22 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn23 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn24 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn25 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.Button1 = New System.Windows.Forms.Button()
        Me.ListBox1 = New System.Windows.Forms.ListBox()
        Me.ExtratesterifiutiTableAdapter1 = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter()
        Me.Button2 = New System.Windows.Forms.Button()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn2 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn3 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn4 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn5 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn6 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn7 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn8 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn9 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn10 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn11 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn12 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn13 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn14 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn15 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn16 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.SuspendLayout()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.EXTRATESTERIFIUTIDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'SicuraDataSet
        '
        Me.SicuraDataSet.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'Biri_MonitoraggioRifiutiBindingSource
        '
        Me.Biri_MonitoraggioRifiutiBindingSource.DataMember = "Biri_MonitoraggioRifiuti"
        Me.Biri_MonitoraggioRifiutiBindingSource.DataSource = Me.SicuraDataSet
        '
        'Biri_MonitoraggioRifiutiTableAdapter
        '
        Me.Biri_MonitoraggioRifiutiTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Codici_CERTableAdapter = Me.Codici_CERTableAdapter
        Me.TableAdapterManager.EXTRATESTEDOCTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTERIFIUTITableAdapter = Me.EXTRATESTERIFIUTITableAdapter
        Me.TableAdapterManager.RIGHEDOCUMENTITableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'Codici_CERTableAdapter
        '
        Me.Codici_CERTableAdapter.ClearBeforeFill = True
        '
        'EXTRATESTERIFIUTITableAdapter
        '
        Me.EXTRATESTERIFIUTITableAdapter.ClearBeforeFill = True
        '
        'Biri_MonitoraggioRifiutiBindingNavigator
        '
        Me.Biri_MonitoraggioRifiutiBindingNavigator.AddNewItem = Nothing
        Me.Biri_MonitoraggioRifiutiBindingNavigator.BindingSource = Me.Biri_MonitoraggioRifiutiBindingSource
        Me.Biri_MonitoraggioRifiutiBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.DeleteItem = Nothing
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2})
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Name = "Biri_MonitoraggioRifiutiBindingNavigator"
        Me.Biri_MonitoraggioRifiutiBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Size = New System.Drawing.Size(1189, 25)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.TabIndex = 0
        Me.Biri_MonitoraggioRifiutiBindingNavigator.Text = "BindingNavigator1"
        '
        'BindingNavigatorCountItem
        '
        Me.BindingNavigatorCountItem.Name = "BindingNavigatorCountItem"
        Me.BindingNavigatorCountItem.Size = New System.Drawing.Size(34, 22)
        Me.BindingNavigatorCountItem.Text = "di {0}"
        Me.BindingNavigatorCountItem.ToolTipText = "Numero totale di elementi"
        '
        'BindingNavigatorMoveFirstItem
        '
        Me.BindingNavigatorMoveFirstItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveFirstItem.Image = CType(resources.GetObject("BindingNavigatorMoveFirstItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveFirstItem.Name = "BindingNavigatorMoveFirstItem"
        Me.BindingNavigatorMoveFirstItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveFirstItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveFirstItem.Text = "Sposta in prima posizione"
        '
        'BindingNavigatorMovePreviousItem
        '
        Me.BindingNavigatorMovePreviousItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMovePreviousItem.Image = CType(resources.GetObject("BindingNavigatorMovePreviousItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMovePreviousItem.Name = "BindingNavigatorMovePreviousItem"
        Me.BindingNavigatorMovePreviousItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMovePreviousItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMovePreviousItem.Text = "Sposta indietro"
        '
        'BindingNavigatorSeparator
        '
        Me.BindingNavigatorSeparator.Name = "BindingNavigatorSeparator"
        Me.BindingNavigatorSeparator.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorPositionItem
        '
        Me.BindingNavigatorPositionItem.AccessibleName = "Posizione"
        Me.BindingNavigatorPositionItem.AutoSize = False
        Me.BindingNavigatorPositionItem.Name = "BindingNavigatorPositionItem"
        Me.BindingNavigatorPositionItem.Size = New System.Drawing.Size(50, 23)
        Me.BindingNavigatorPositionItem.Text = "0"
        Me.BindingNavigatorPositionItem.ToolTipText = "Posizione corrente"
        '
        'BindingNavigatorSeparator1
        '
        Me.BindingNavigatorSeparator1.Name = "BindingNavigatorSeparator1"
        Me.BindingNavigatorSeparator1.Size = New System.Drawing.Size(6, 25)
        '
        'BindingNavigatorMoveNextItem
        '
        Me.BindingNavigatorMoveNextItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveNextItem.Image = CType(resources.GetObject("BindingNavigatorMoveNextItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveNextItem.Name = "BindingNavigatorMoveNextItem"
        Me.BindingNavigatorMoveNextItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveNextItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveNextItem.Text = "Sposta avanti"
        '
        'BindingNavigatorMoveLastItem
        '
        Me.BindingNavigatorMoveLastItem.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.BindingNavigatorMoveLastItem.Image = CType(resources.GetObject("BindingNavigatorMoveLastItem.Image"), System.Drawing.Image)
        Me.BindingNavigatorMoveLastItem.Name = "BindingNavigatorMoveLastItem"
        Me.BindingNavigatorMoveLastItem.RightToLeftAutoMirrorImage = True
        Me.BindingNavigatorMoveLastItem.Size = New System.Drawing.Size(23, 22)
        Me.BindingNavigatorMoveLastItem.Text = "Sposta in ultima posizione"
        '
        'BindingNavigatorSeparator2
        '
        Me.BindingNavigatorSeparator2.Name = "BindingNavigatorSeparator2"
        Me.BindingNavigatorSeparator2.Size = New System.Drawing.Size(6, 25)
        '
        'Biri_MonitoraggioRifiutiDataGridView
        '
        Me.Biri_MonitoraggioRifiutiDataGridView.AutoGenerateColumns = False
        Me.Biri_MonitoraggioRifiutiDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.Biri_MonitoraggioRifiutiDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.DataGridViewTextBoxColumn16})
        Me.Biri_MonitoraggioRifiutiDataGridView.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        Me.Biri_MonitoraggioRifiutiDataGridView.Location = New System.Drawing.Point(0, 28)
        Me.Biri_MonitoraggioRifiutiDataGridView.Name = "Biri_MonitoraggioRifiutiDataGridView"
        Me.Biri_MonitoraggioRifiutiDataGridView.Size = New System.Drawing.Size(1169, 264)
        Me.Biri_MonitoraggioRifiutiDataGridView.TabIndex = 1
        '
        'EXTRATESTERIFIUTIBindingSource
        '
        Me.EXTRATESTERIFIUTIBindingSource.DataMember = "EXTRATESTERIFIUTI"
        Me.EXTRATESTERIFIUTIBindingSource.DataSource = Me.SicuraDataSet
        '
        'EXTRATESTERIFIUTIDataGridView
        '
        Me.EXTRATESTERIFIUTIDataGridView.AutoGenerateColumns = False
        Me.EXTRATESTERIFIUTIDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.EXTRATESTERIFIUTIDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn17, Me.DataGridViewTextBoxColumn18, Me.DataGridViewTextBoxColumn20, Me.TipoCer, Me.DataGridViewTextBoxColumn21, Me.DataGridViewCheckBoxColumn1, Me.DataGridViewTextBoxColumn22, Me.DataGridViewTextBoxColumn23, Me.DataGridViewTextBoxColumn24, Me.DataGridViewTextBoxColumn25})
        Me.EXTRATESTERIFIUTIDataGridView.DataSource = Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource
        Me.EXTRATESTERIFIUTIDataGridView.Location = New System.Drawing.Point(0, 312)
        Me.EXTRATESTERIFIUTIDataGridView.Name = "EXTRATESTERIFIUTIDataGridView"
        Me.EXTRATESTERIFIUTIDataGridView.Size = New System.Drawing.Size(696, 173)
        Me.EXTRATESTERIFIUTIDataGridView.TabIndex = 2
        '
        'DataGridViewTextBoxColumn17
        '
        Me.DataGridViewTextBoxColumn17.DataPropertyName = "ID_Extratesterifiuti"
        Me.DataGridViewTextBoxColumn17.HeaderText = "ID_Extratesterifiuti"
        Me.DataGridViewTextBoxColumn17.Name = "DataGridViewTextBoxColumn17"
        Me.DataGridViewTextBoxColumn17.ReadOnly = True
        Me.DataGridViewTextBoxColumn17.Visible = False
        '
        'DataGridViewTextBoxColumn18
        '
        Me.DataGridViewTextBoxColumn18.DataPropertyName = "IDTESTA"
        Me.DataGridViewTextBoxColumn18.HeaderText = "IDTESTA"
        Me.DataGridViewTextBoxColumn18.Name = "DataGridViewTextBoxColumn18"
        Me.DataGridViewTextBoxColumn18.Visible = False
        '
        'DataGridViewTextBoxColumn20
        '
        Me.DataGridViewTextBoxColumn20.DataPropertyName = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn20.HeaderText = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn20.Name = "DataGridViewTextBoxColumn20"
        '
        'TipoCer
        '
        Me.TipoCer.DataPropertyName = "TIPORIFIUTO"
        Me.TipoCer.DataSource = Me.CodiciCERBindingSource
        Me.TipoCer.DisplayMember = "DESCRIZIONECER"
        Me.TipoCer.HeaderText = "TipoCer"
        Me.TipoCer.Name = "TipoCer"
        Me.TipoCer.ValueMember = "ID"
        '
        'CodiciCERBindingSource
        '
        Me.CodiciCERBindingSource.DataMember = "Codici_CER"
        Me.CodiciCERBindingSource.DataSource = Me.SicuraDataSet
        '
        'DataGridViewTextBoxColumn21
        '
        Me.DataGridViewTextBoxColumn21.DataPropertyName = "DataRitiro"
        Me.DataGridViewTextBoxColumn21.HeaderText = "DataRitiro"
        Me.DataGridViewTextBoxColumn21.Name = "DataGridViewTextBoxColumn21"
        '
        'DataGridViewCheckBoxColumn1
        '
        Me.DataGridViewCheckBoxColumn1.DataPropertyName = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.HeaderText = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.Name = "DataGridViewCheckBoxColumn1"
        '
        'DataGridViewTextBoxColumn22
        '
        Me.DataGridViewTextBoxColumn22.DataPropertyName = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn22.HeaderText = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn22.Name = "DataGridViewTextBoxColumn22"
        '
        'DataGridViewTextBoxColumn23
        '
        Me.DataGridViewTextBoxColumn23.DataPropertyName = "Note"
        Me.DataGridViewTextBoxColumn23.HeaderText = "Note"
        Me.DataGridViewTextBoxColumn23.Name = "DataGridViewTextBoxColumn23"
        '
        'DataGridViewTextBoxColumn24
        '
        Me.DataGridViewTextBoxColumn24.DataPropertyName = "Datetime"
        Me.DataGridViewTextBoxColumn24.HeaderText = "Datetime"
        Me.DataGridViewTextBoxColumn24.Name = "DataGridViewTextBoxColumn24"
        Me.DataGridViewTextBoxColumn24.Visible = False
        '
        'DataGridViewTextBoxColumn25
        '
        Me.DataGridViewTextBoxColumn25.DataPropertyName = "UTENTEMODIFICA"
        Me.DataGridViewTextBoxColumn25.HeaderText = "UTENTEMODIFICA"
        Me.DataGridViewTextBoxColumn25.Name = "DataGridViewTextBoxColumn25"
        Me.DataGridViewTextBoxColumn25.Visible = False
        '
        'BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource
        '
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.DataMember = "Biri_MonitoraggioRifiuti_EXTRATESTERIFIUTI"
        Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource.DataSource = Me.Biri_MonitoraggioRifiutiBindingSource
        '
        'Button1
        '
        Me.Button1.Location = New System.Drawing.Point(1080, 312)
        Me.Button1.Name = "Button1"
        Me.Button1.Size = New System.Drawing.Size(75, 26)
        Me.Button1.TabIndex = 3
        Me.Button1.Text = "Button1"
        Me.Button1.UseVisualStyleBackColor = True
        '
        'ListBox1
        '
        Me.ListBox1.FormattingEnabled = True
        Me.ListBox1.Location = New System.Drawing.Point(731, 312)
        Me.ListBox1.Name = "ListBox1"
        Me.ListBox1.ScrollAlwaysVisible = True
        Me.ListBox1.Size = New System.Drawing.Size(321, 173)
        Me.ListBox1.TabIndex = 4
        '
        'ExtratesterifiutiTableAdapter1
        '
        Me.ExtratesterifiutiTableAdapter1.ClearBeforeFill = True
        '
        'Button2
        '
        Me.Button2.Location = New System.Drawing.Point(666, 360)
        Me.Button2.Name = "Button2"
        Me.Button2.Size = New System.Drawing.Size(75, 28)
        Me.Button2.TabIndex = 5
        Me.Button2.Text = "Button2"
        Me.Button2.UseVisualStyleBackColor = True
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.HeaderText = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.Visible = False
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "ESERCIZIO + TIPODOC"
        Me.DataGridViewTextBoxColumn2.HeaderText = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "TIPODOC"
        Me.DataGridViewTextBoxColumn3.HeaderText = "TIPODOC"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "NUMERODOC"
        Me.DataGridViewTextBoxColumn4.HeaderText = "NUMERODOC"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "DataDoc"
        Me.DataGridViewTextBoxColumn5.HeaderText = "DataDoc"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "StatoDoc"
        Me.DataGridViewTextBoxColumn6.HeaderText = "StatoDoc"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "CODCONTO"
        Me.DataGridViewTextBoxColumn7.HeaderText = "CODCONTO"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "DSCCONTO1"
        Me.DataGridViewTextBoxColumn8.HeaderText = "DSCCONTO1"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "NOTEDOC"
        Me.DataGridViewTextBoxColumn9.HeaderText = "NOTEDOC"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        Me.DataGridViewTextBoxColumn9.Visible = False
        '
        'DataGridViewTextBoxColumn10
        '
        Me.DataGridViewTextBoxColumn10.DataPropertyName = "TipodocSucc"
        Me.DataGridViewTextBoxColumn10.HeaderText = "TipodocSucc"
        Me.DataGridViewTextBoxColumn10.Name = "DataGridViewTextBoxColumn10"
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "NumerodocSucc"
        Me.DataGridViewTextBoxColumn11.HeaderText = "NumerodocSucc"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "DataDocSucc"
        Me.DataGridViewTextBoxColumn12.HeaderText = "DataDocSucc"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "RAGSOCDDM"
        Me.DataGridViewTextBoxColumn13.HeaderText = "RAGSOCDDM"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        '
        'DataGridViewTextBoxColumn14
        '
        Me.DataGridViewTextBoxColumn14.DataPropertyName = "INDIRIZZODDM"
        Me.DataGridViewTextBoxColumn14.HeaderText = "INDIRIZZODDM"
        Me.DataGridViewTextBoxColumn14.Name = "DataGridViewTextBoxColumn14"
        '
        'DataGridViewTextBoxColumn15
        '
        Me.DataGridViewTextBoxColumn15.DataPropertyName = "CAPDDM"
        Me.DataGridViewTextBoxColumn15.HeaderText = "CAPDDM"
        Me.DataGridViewTextBoxColumn15.Name = "DataGridViewTextBoxColumn15"
        '
        'DataGridViewTextBoxColumn16
        '
        Me.DataGridViewTextBoxColumn16.DataPropertyName = "LOCALITADDM"
        Me.DataGridViewTextBoxColumn16.HeaderText = "LOCALITADDM"
        Me.DataGridViewTextBoxColumn16.Name = "DataGridViewTextBoxColumn16"
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1189, 495)
        Me.Controls.Add(Me.Button2)
        Me.Controls.Add(Me.ListBox1)
        Me.Controls.Add(Me.Button1)
        Me.Controls.Add(Me.EXTRATESTERIFIUTIDataGridView)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiDataGridView)
        Me.Controls.Add(Me.Biri_MonitoraggioRifiutiBindingNavigator)
        Me.Name = "Form1"
        Me.Text = "Form1"
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.Biri_MonitoraggioRifiutiBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.Biri_MonitoraggioRifiutiBindingNavigator.ResumeLayout(False)
        Me.Biri_MonitoraggioRifiutiBindingNavigator.PerformLayout()
        CType(Me.Biri_MonitoraggioRifiutiDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.EXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.EXTRATESTERIFIUTIDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.CodiciCERBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents SicuraDataSet As SicuraDataSet
    Friend WithEvents Biri_MonitoraggioRifiutiBindingSource As BindingSource
    Friend WithEvents Biri_MonitoraggioRifiutiTableAdapter As SicuraDataSetTableAdapters.Biri_MonitoraggioRifiutiTableAdapter
    Friend WithEvents TableAdapterManager As SicuraDataSetTableAdapters.TableAdapterManager
    Friend WithEvents Biri_MonitoraggioRifiutiBindingNavigator As BindingNavigator
    Friend WithEvents BindingNavigatorCountItem As ToolStripLabel
    Friend WithEvents BindingNavigatorMoveFirstItem As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As ToolStripSeparator
    Friend WithEvents EXTRATESTERIFIUTITableAdapter As SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter
    Friend WithEvents Biri_MonitoraggioRifiutiDataGridView As DataGridView
    Friend WithEvents EXTRATESTERIFIUTIBindingSource As BindingSource
    Friend WithEvents Codici_CERTableAdapter As SicuraDataSetTableAdapters.Codici_CERTableAdapter
    Friend WithEvents EXTRATESTERIFIUTIDataGridView As DataGridView
    Friend WithEvents BiriMonitoraggioRifiutiEXTRATESTERIFIUTIBindingSource As BindingSource
    Friend WithEvents CodiciCERBindingSource As BindingSource
    Friend WithEvents DataGridViewTextBoxColumn17 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn18 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn20 As DataGridViewTextBoxColumn
    Friend WithEvents TipoCer As DataGridViewComboBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn21 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewCheckBoxColumn1 As DataGridViewCheckBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn22 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn23 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn24 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn25 As DataGridViewTextBoxColumn
    Friend WithEvents Button1 As Button
    Friend WithEvents ListBox1 As ListBox
    Friend WithEvents ExtratesterifiutiTableAdapter1 As SicuraDataSetTableAdapters.EXTRATESTERIFIUTITableAdapter
    Friend WithEvents Button2 As Button
    Friend WithEvents DataGridViewTextBoxColumn1 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn2 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn3 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn4 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn5 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn6 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn7 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn8 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn9 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn10 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn11 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn12 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn13 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn16 As DataGridViewTextBoxColumn
End Class
