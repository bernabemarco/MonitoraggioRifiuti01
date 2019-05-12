<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class Main
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
        Me.OpenDash = New System.Windows.Forms.Button()
        Me.Esci = New System.Windows.Forms.Button()
        Me.OpenRiep = New System.Windows.Forms.Button()
        Me.ProgressBar1 = New System.Windows.Forms.ProgressBar()
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.SuspendLayout()
        '
        'OpenDash
        '
        Me.OpenDash.Location = New System.Drawing.Point(55, 64)
        Me.OpenDash.Name = "OpenDash"
        Me.OpenDash.Size = New System.Drawing.Size(88, 37)
        Me.OpenDash.TabIndex = 0
        Me.OpenDash.Text = "Apri Form Cruscotto"
        Me.OpenDash.UseVisualStyleBackColor = True
        '
        'Esci
        '
        Me.Esci.Location = New System.Drawing.Point(269, 245)
        Me.Esci.Name = "Esci"
        Me.Esci.Size = New System.Drawing.Size(88, 37)
        Me.Esci.TabIndex = 1
        Me.Esci.Text = "Esci"
        Me.Esci.UseVisualStyleBackColor = True
        '
        'OpenRiep
        '
        Me.OpenRiep.Location = New System.Drawing.Point(177, 64)
        Me.OpenRiep.Name = "OpenRiep"
        Me.OpenRiep.Size = New System.Drawing.Size(88, 37)
        Me.OpenRiep.TabIndex = 2
        Me.OpenRiep.Text = "Apri Riepilogo Attività"
        Me.OpenRiep.UseVisualStyleBackColor = True
        '
        'ProgressBar1
        '
        Me.ProgressBar1.Location = New System.Drawing.Point(116, 132)
        Me.ProgressBar1.Name = "ProgressBar1"
        Me.ProgressBar1.Size = New System.Drawing.Size(100, 23)
        Me.ProgressBar1.TabIndex = 3
        '
        'Main
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(369, 311)
        Me.Controls.Add(Me.ProgressBar1)
        Me.Controls.Add(Me.OpenRiep)
        Me.Controls.Add(Me.Esci)
        Me.Controls.Add(Me.OpenDash)
        Me.Name = "Main"
        Me.Text = "Main"
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents OpenDash As Button
    Friend WithEvents Esci As Button
    Friend WithEvents OpenRiep As Button
    Friend WithEvents ProgressBar1 As ProgressBar
    Friend WithEvents Timer1 As Timer
End Class
