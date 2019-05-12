<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class RiepilogoGenerale
    Inherits System.Windows.Forms.Form

    'Form esegue l'override del metodo Dispose per pulire l'elenco dei componenti.
    <System.Diagnostics.DebuggerNonUserCode()>
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
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(RiepilogoGenerale))
        Me.SicuraDataSet = New MonitoraggioRifiuti.SicuraDataSet()
        Me.RiepilogoGeneraleDTBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.RiepilogoGeneraleDTTableAdapter = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.RiepilogoGeneraleDTTableAdapter()
        Me.TableAdapterManager = New MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager()
        Me.RiepilogoGeneraleDTBindingNavigator = New System.Windows.Forms.BindingNavigator(Me.components)
        Me.BindingNavigatorCountItem = New System.Windows.Forms.ToolStripLabel()
        Me.BindingNavigatorMoveFirstItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMovePreviousItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorPositionItem = New System.Windows.Forms.ToolStripTextBox()
        Me.BindingNavigatorSeparator1 = New System.Windows.Forms.ToolStripSeparator()
        Me.BindingNavigatorMoveNextItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorMoveLastItem = New System.Windows.Forms.ToolStripButton()
        Me.BindingNavigatorSeparator2 = New System.Windows.Forms.ToolStripSeparator()
        Me.TextBoxFiltro = New System.Windows.Forms.ToolStripTextBox()
        Me.ApplicaFiltro = New System.Windows.Forms.ToolStripButton()
        Me.RimuoviFiltro = New System.Windows.Forms.ToolStripButton()
        Me.RiepilogoGeneraleDTDataGridView = New System.Windows.Forms.DataGridView()
        Me.DataGridViewTextBoxColumn1 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.FeedGestione = New System.Windows.Forms.DataGridViewImageColumn()
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
        Me.DataGridViewCheckBoxColumn1 = New System.Windows.Forms.DataGridViewCheckBoxColumn()
        Me.DataGridViewTextBoxColumn14 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.DataGridViewTextBoxColumn15 = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.Allegati = New System.Windows.Forms.DataGridViewTextBoxColumn()
        Me.StatoImageList = New System.Windows.Forms.ImageList(Me.components)
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.RiepilogoGeneraleDTBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.RiepilogoGeneraleDTBindingNavigator, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.RiepilogoGeneraleDTBindingNavigator.SuspendLayout()
        CType(Me.RiepilogoGeneraleDTDataGridView, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'SicuraDataSet
        '
        Me.SicuraDataSet.DataSetName = "SicuraDataSet"
        Me.SicuraDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'RiepilogoGeneraleDTBindingSource
        '
        Me.RiepilogoGeneraleDTBindingSource.DataMember = "RiepilogoGeneraleDT"
        Me.RiepilogoGeneraleDTBindingSource.DataSource = Me.SicuraDataSet
        '
        'RiepilogoGeneraleDTTableAdapter
        '
        Me.RiepilogoGeneraleDTTableAdapter.ClearBeforeFill = True
        '
        'TableAdapterManager
        '
        Me.TableAdapterManager.BackupDataSetBeforeUpdate = False
        Me.TableAdapterManager.Codici_CERTableAdapter = Nothing
        Me.TableAdapterManager.Connection = Nothing
        Me.TableAdapterManager.EXTRATESTEDOCTableAdapter = Nothing
        Me.TableAdapterManager.EXTRATESTERIFIUTITableAdapter = Nothing
        Me.TableAdapterManager.RIGHEDOCUMENTITableAdapter = Nothing
        Me.TableAdapterManager.UpdateOrder = MonitoraggioRifiuti.SicuraDataSetTableAdapters.TableAdapterManager.UpdateOrderOption.InsertUpdateDelete
        '
        'RiepilogoGeneraleDTBindingNavigator
        '
        Me.RiepilogoGeneraleDTBindingNavigator.AddNewItem = Nothing
        Me.RiepilogoGeneraleDTBindingNavigator.BindingSource = Me.RiepilogoGeneraleDTBindingSource
        Me.RiepilogoGeneraleDTBindingNavigator.CountItem = Me.BindingNavigatorCountItem
        Me.RiepilogoGeneraleDTBindingNavigator.DeleteItem = Nothing
        Me.RiepilogoGeneraleDTBindingNavigator.Items.AddRange(New System.Windows.Forms.ToolStripItem() {Me.BindingNavigatorMoveFirstItem, Me.BindingNavigatorMovePreviousItem, Me.BindingNavigatorSeparator, Me.BindingNavigatorPositionItem, Me.BindingNavigatorCountItem, Me.BindingNavigatorSeparator1, Me.BindingNavigatorMoveNextItem, Me.BindingNavigatorMoveLastItem, Me.BindingNavigatorSeparator2, Me.TextBoxFiltro, Me.ApplicaFiltro, Me.RimuoviFiltro})
        Me.RiepilogoGeneraleDTBindingNavigator.Location = New System.Drawing.Point(0, 0)
        Me.RiepilogoGeneraleDTBindingNavigator.MoveFirstItem = Me.BindingNavigatorMoveFirstItem
        Me.RiepilogoGeneraleDTBindingNavigator.MoveLastItem = Me.BindingNavigatorMoveLastItem
        Me.RiepilogoGeneraleDTBindingNavigator.MoveNextItem = Me.BindingNavigatorMoveNextItem
        Me.RiepilogoGeneraleDTBindingNavigator.MovePreviousItem = Me.BindingNavigatorMovePreviousItem
        Me.RiepilogoGeneraleDTBindingNavigator.Name = "RiepilogoGeneraleDTBindingNavigator"
        Me.RiepilogoGeneraleDTBindingNavigator.PositionItem = Me.BindingNavigatorPositionItem
        Me.RiepilogoGeneraleDTBindingNavigator.Size = New System.Drawing.Size(812, 25)
        Me.RiepilogoGeneraleDTBindingNavigator.TabIndex = 0
        Me.RiepilogoGeneraleDTBindingNavigator.Text = "BindingNavigator1"
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
        'TextBoxFiltro
        '
        Me.TextBoxFiltro.Name = "TextBoxFiltro"
        Me.TextBoxFiltro.Size = New System.Drawing.Size(200, 25)
        '
        'ApplicaFiltro
        '
        Me.ApplicaFiltro.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.ApplicaFiltro.Image = Global.MonitoraggioRifiuti.My.Resources.Resources.icons8_ricerca_32__1_
        Me.ApplicaFiltro.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.ApplicaFiltro.Name = "ApplicaFiltro"
        Me.ApplicaFiltro.Size = New System.Drawing.Size(23, 22)
        Me.ApplicaFiltro.Text = "ApplicaFiltro"
        '
        'RimuoviFiltro
        '
        Me.RimuoviFiltro.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image
        Me.RimuoviFiltro.Image = Global.MonitoraggioRifiuti.My.Resources.Resources.icons8_eliminare_32
        Me.RimuoviFiltro.ImageTransparentColor = System.Drawing.Color.Magenta
        Me.RimuoviFiltro.Name = "RimuoviFiltro"
        Me.RimuoviFiltro.Size = New System.Drawing.Size(23, 22)
        Me.RimuoviFiltro.Text = "RimuoviFiltro"
        '
        'RiepilogoGeneraleDTDataGridView
        '
        Me.RiepilogoGeneraleDTDataGridView.AllowUserToAddRows = False
        Me.RiepilogoGeneraleDTDataGridView.AllowUserToDeleteRows = False
        Me.RiepilogoGeneraleDTDataGridView.AutoGenerateColumns = False
        Me.RiepilogoGeneraleDTDataGridView.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize
        Me.RiepilogoGeneraleDTDataGridView.Columns.AddRange(New System.Windows.Forms.DataGridViewColumn() {Me.DataGridViewTextBoxColumn1, Me.FeedGestione, Me.DataGridViewTextBoxColumn2, Me.DataGridViewTextBoxColumn3, Me.DataGridViewTextBoxColumn4, Me.DataGridViewTextBoxColumn5, Me.DataGridViewTextBoxColumn6, Me.DataGridViewTextBoxColumn7, Me.DataGridViewTextBoxColumn8, Me.DataGridViewTextBoxColumn9, Me.DataGridViewTextBoxColumn10, Me.DataGridViewTextBoxColumn11, Me.DataGridViewTextBoxColumn12, Me.DataGridViewTextBoxColumn13, Me.DataGridViewCheckBoxColumn1, Me.DataGridViewTextBoxColumn14, Me.DataGridViewTextBoxColumn15, Me.Allegati})
        Me.RiepilogoGeneraleDTDataGridView.DataSource = Me.RiepilogoGeneraleDTBindingSource
        Me.RiepilogoGeneraleDTDataGridView.Dock = System.Windows.Forms.DockStyle.Fill
        Me.RiepilogoGeneraleDTDataGridView.Location = New System.Drawing.Point(0, 25)
        Me.RiepilogoGeneraleDTDataGridView.Name = "RiepilogoGeneraleDTDataGridView"
        Me.RiepilogoGeneraleDTDataGridView.ReadOnly = True
        Me.RiepilogoGeneraleDTDataGridView.Size = New System.Drawing.Size(812, 425)
        Me.RiepilogoGeneraleDTDataGridView.TabIndex = 1
        '
        'DataGridViewTextBoxColumn1
        '
        Me.DataGridViewTextBoxColumn1.DataPropertyName = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.HeaderText = "PROGRESSIVO"
        Me.DataGridViewTextBoxColumn1.Name = "DataGridViewTextBoxColumn1"
        Me.DataGridViewTextBoxColumn1.ReadOnly = True
        Me.DataGridViewTextBoxColumn1.Visible = False
        '
        'FeedGestione
        '
        Me.FeedGestione.HeaderText = "FeedGestione"
        Me.FeedGestione.Name = "FeedGestione"
        Me.FeedGestione.ReadOnly = True
        Me.FeedGestione.Resizable = System.Windows.Forms.DataGridViewTriState.[True]
        Me.FeedGestione.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic
        '
        'DataGridViewTextBoxColumn2
        '
        Me.DataGridViewTextBoxColumn2.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn2.DataPropertyName = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn2.HeaderText = "ESERCIZIO"
        Me.DataGridViewTextBoxColumn2.Name = "DataGridViewTextBoxColumn2"
        Me.DataGridViewTextBoxColumn2.ReadOnly = True
        Me.DataGridViewTextBoxColumn2.Width = 89
        '
        'DataGridViewTextBoxColumn3
        '
        Me.DataGridViewTextBoxColumn3.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn3.DataPropertyName = "TIPODOC"
        Me.DataGridViewTextBoxColumn3.HeaderText = "TIPODOC"
        Me.DataGridViewTextBoxColumn3.Name = "DataGridViewTextBoxColumn3"
        Me.DataGridViewTextBoxColumn3.ReadOnly = True
        Me.DataGridViewTextBoxColumn3.Width = 80
        '
        'DataGridViewTextBoxColumn4
        '
        Me.DataGridViewTextBoxColumn4.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn4.DataPropertyName = "NUMERODOC"
        Me.DataGridViewTextBoxColumn4.HeaderText = "NUMERODOC"
        Me.DataGridViewTextBoxColumn4.Name = "DataGridViewTextBoxColumn4"
        Me.DataGridViewTextBoxColumn4.ReadOnly = True
        Me.DataGridViewTextBoxColumn4.Width = 103
        '
        'DataGridViewTextBoxColumn5
        '
        Me.DataGridViewTextBoxColumn5.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn5.DataPropertyName = "DataDoc"
        Me.DataGridViewTextBoxColumn5.HeaderText = "DataDoc"
        Me.DataGridViewTextBoxColumn5.Name = "DataGridViewTextBoxColumn5"
        Me.DataGridViewTextBoxColumn5.ReadOnly = True
        Me.DataGridViewTextBoxColumn5.Width = 75
        '
        'DataGridViewTextBoxColumn6
        '
        Me.DataGridViewTextBoxColumn6.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn6.DataPropertyName = "StatoDoc"
        Me.DataGridViewTextBoxColumn6.HeaderText = "StatoDoc"
        Me.DataGridViewTextBoxColumn6.Name = "DataGridViewTextBoxColumn6"
        Me.DataGridViewTextBoxColumn6.ReadOnly = True
        Me.DataGridViewTextBoxColumn6.Width = 77
        '
        'DataGridViewTextBoxColumn7
        '
        Me.DataGridViewTextBoxColumn7.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn7.DataPropertyName = "CODCONTO"
        Me.DataGridViewTextBoxColumn7.HeaderText = "CODCONTO"
        Me.DataGridViewTextBoxColumn7.Name = "DataGridViewTextBoxColumn7"
        Me.DataGridViewTextBoxColumn7.ReadOnly = True
        Me.DataGridViewTextBoxColumn7.Width = 93
        '
        'DataGridViewTextBoxColumn8
        '
        Me.DataGridViewTextBoxColumn8.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn8.DataPropertyName = "CLIENTE"
        Me.DataGridViewTextBoxColumn8.HeaderText = "CLIENTE"
        Me.DataGridViewTextBoxColumn8.Name = "DataGridViewTextBoxColumn8"
        Me.DataGridViewTextBoxColumn8.ReadOnly = True
        Me.DataGridViewTextBoxColumn8.Width = 77
        '
        'DataGridViewTextBoxColumn9
        '
        Me.DataGridViewTextBoxColumn9.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn9.DataPropertyName = "LOCALITA"
        Me.DataGridViewTextBoxColumn9.HeaderText = "LOCALITA"
        Me.DataGridViewTextBoxColumn9.Name = "DataGridViewTextBoxColumn9"
        Me.DataGridViewTextBoxColumn9.ReadOnly = True
        Me.DataGridViewTextBoxColumn9.Width = 83
        '
        'DataGridViewTextBoxColumn10
        '
        Me.DataGridViewTextBoxColumn10.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn10.DataPropertyName = "InGestione"
        Me.DataGridViewTextBoxColumn10.HeaderText = "InGestione"
        Me.DataGridViewTextBoxColumn10.Name = "DataGridViewTextBoxColumn10"
        Me.DataGridViewTextBoxColumn10.ReadOnly = True
        Me.DataGridViewTextBoxColumn10.Width = 83
        '
        'DataGridViewTextBoxColumn11
        '
        Me.DataGridViewTextBoxColumn11.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn11.DataPropertyName = "TIPORIFIUTO"
        Me.DataGridViewTextBoxColumn11.HeaderText = "TIPORIFIUTO"
        Me.DataGridViewTextBoxColumn11.Name = "DataGridViewTextBoxColumn11"
        Me.DataGridViewTextBoxColumn11.ReadOnly = True
        '
        'DataGridViewTextBoxColumn12
        '
        Me.DataGridViewTextBoxColumn12.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn12.DataPropertyName = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn12.HeaderText = "GiustificativoCer"
        Me.DataGridViewTextBoxColumn12.Name = "DataGridViewTextBoxColumn12"
        Me.DataGridViewTextBoxColumn12.ReadOnly = True
        Me.DataGridViewTextBoxColumn12.Width = 108
        '
        'DataGridViewTextBoxColumn13
        '
        Me.DataGridViewTextBoxColumn13.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn13.DataPropertyName = "RitiroEseguito"
        Me.DataGridViewTextBoxColumn13.HeaderText = "RitiroEseguito"
        Me.DataGridViewTextBoxColumn13.Name = "DataGridViewTextBoxColumn13"
        Me.DataGridViewTextBoxColumn13.ReadOnly = True
        Me.DataGridViewTextBoxColumn13.Width = 97
        '
        'DataGridViewCheckBoxColumn1
        '
        Me.DataGridViewCheckBoxColumn1.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewCheckBoxColumn1.DataPropertyName = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.HeaderText = "Arrivo4Copia"
        Me.DataGridViewCheckBoxColumn1.Name = "DataGridViewCheckBoxColumn1"
        Me.DataGridViewCheckBoxColumn1.ReadOnly = True
        Me.DataGridViewCheckBoxColumn1.Width = 73
        '
        'DataGridViewTextBoxColumn14
        '
        Me.DataGridViewTextBoxColumn14.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn14.DataPropertyName = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn14.HeaderText = "DataArrivoFormulario"
        Me.DataGridViewTextBoxColumn14.Name = "DataGridViewTextBoxColumn14"
        Me.DataGridViewTextBoxColumn14.ReadOnly = True
        Me.DataGridViewTextBoxColumn14.Width = 130
        '
        'DataGridViewTextBoxColumn15
        '
        Me.DataGridViewTextBoxColumn15.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.DisplayedCells
        Me.DataGridViewTextBoxColumn15.DataPropertyName = "Note"
        Me.DataGridViewTextBoxColumn15.HeaderText = "Note"
        Me.DataGridViewTextBoxColumn15.Name = "DataGridViewTextBoxColumn15"
        Me.DataGridViewTextBoxColumn15.ReadOnly = True
        Me.DataGridViewTextBoxColumn15.Width = 55
        '
        'Allegati
        '
        Me.Allegati.DataPropertyName = "Allegati"
        Me.Allegati.HeaderText = "Allegati"
        Me.Allegati.Name = "Allegati"
        Me.Allegati.ReadOnly = True
        '
        'StatoImageList
        '
        Me.StatoImageList.ImageStream = CType(resources.GetObject("StatoImageList.ImageStream"), System.Windows.Forms.ImageListStreamer)
        Me.StatoImageList.TransparentColor = System.Drawing.Color.Transparent
        Me.StatoImageList.Images.SetKeyName(0, "iconfinder_caution_1055096.png")
        Me.StatoImageList.Images.SetKeyName(1, "iconfinder_Gnome-Emblem-Default-64_55596.png")
        Me.StatoImageList.Images.SetKeyName(2, "iconfinder_Education-Filled_15_3672887.png")
        '
        'RiepilogoGenerale
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(812, 450)
        Me.Controls.Add(Me.RiepilogoGeneraleDTDataGridView)
        Me.Controls.Add(Me.RiepilogoGeneraleDTBindingNavigator)
        Me.Name = "RiepilogoGenerale"
        Me.Text = "RiepilogoGenerale"
        CType(Me.SicuraDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.RiepilogoGeneraleDTBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.RiepilogoGeneraleDTBindingNavigator, System.ComponentModel.ISupportInitialize).EndInit()
        Me.RiepilogoGeneraleDTBindingNavigator.ResumeLayout(False)
        Me.RiepilogoGeneraleDTBindingNavigator.PerformLayout()
        CType(Me.RiepilogoGeneraleDTDataGridView, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub

    Friend WithEvents SicuraDataSet As SicuraDataSet
    Friend WithEvents RiepilogoGeneraleDTBindingSource As BindingSource
    Friend WithEvents RiepilogoGeneraleDTTableAdapter As SicuraDataSetTableAdapters.RiepilogoGeneraleDTTableAdapter
    Friend WithEvents TableAdapterManager As SicuraDataSetTableAdapters.TableAdapterManager
    Friend WithEvents RiepilogoGeneraleDTBindingNavigator As BindingNavigator
    Friend WithEvents BindingNavigatorCountItem As ToolStripLabel
    Friend WithEvents BindingNavigatorMoveFirstItem As ToolStripButton
    Friend WithEvents BindingNavigatorMovePreviousItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator As ToolStripSeparator
    Friend WithEvents BindingNavigatorPositionItem As ToolStripTextBox
    Friend WithEvents BindingNavigatorSeparator1 As ToolStripSeparator
    Friend WithEvents BindingNavigatorMoveNextItem As ToolStripButton
    Friend WithEvents BindingNavigatorMoveLastItem As ToolStripButton
    Friend WithEvents BindingNavigatorSeparator2 As ToolStripSeparator
    Friend WithEvents RiepilogoGeneraleDTDataGridView As DataGridView
    Friend WithEvents TextBoxFiltro As ToolStripTextBox
    Friend WithEvents ApplicaFiltro As ToolStripButton
    Friend WithEvents RimuoviFiltro As ToolStripButton
    Friend WithEvents DataGridViewTextBoxColumn1 As DataGridViewTextBoxColumn
    Friend WithEvents FeedGestione As DataGridViewImageColumn
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
    Friend WithEvents DataGridViewCheckBoxColumn1 As DataGridViewCheckBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn14 As DataGridViewTextBoxColumn
    Friend WithEvents DataGridViewTextBoxColumn15 As DataGridViewTextBoxColumn
    Friend WithEvents Allegati As DataGridViewTextBoxColumn
    Friend WithEvents StatoImageList As ImageList
End Class
