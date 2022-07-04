namespace OutwardProcessor
{
    partial class ProcessOutward
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.startOutwardProcessingBtn = new System.Windows.Forms.Button();
            this.statusLabel = new System.Windows.Forms.Label();
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.oceTypeComboBox = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.stopBtn = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // startOutwardProcessingBtn
            // 
            this.startOutwardProcessingBtn.Location = new System.Drawing.Point(122, 65);
            this.startOutwardProcessingBtn.Name = "startOutwardProcessingBtn";
            this.startOutwardProcessingBtn.Size = new System.Drawing.Size(96, 23);
            this.startOutwardProcessingBtn.TabIndex = 0;
            this.startOutwardProcessingBtn.Text = "Start Processing";
            this.startOutwardProcessingBtn.UseVisualStyleBackColor = true;
            this.startOutwardProcessingBtn.Click += new System.EventHandler(this.StartOutwardProcessingBtn_Click);
            // 
            // statusLabel
            // 
            this.statusLabel.AutoSize = true;
            this.statusLabel.Location = new System.Drawing.Point(119, 108);
            this.statusLabel.Name = "statusLabel";
            this.statusLabel.Size = new System.Drawing.Size(0, 13);
            this.statusLabel.TabIndex = 1;
            this.statusLabel.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // oceTypeComboBox
            // 
            this.oceTypeComboBox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.oceTypeComboBox.FormattingEnabled = true;
            this.oceTypeComboBox.Items.AddRange(new object[] {
            "RV",
            "HV"});
            this.oceTypeComboBox.Location = new System.Drawing.Point(122, 32);
            this.oceTypeComboBox.Name = "oceTypeComboBox";
            this.oceTypeComboBox.Size = new System.Drawing.Size(96, 21);
            this.oceTypeComboBox.TabIndex = 2;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(27, 35);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(89, 13);
            this.label1.TabIndex = 3;
            this.label1.Text = "Select OCE Type";
            // 
            // stopBtn
            // 
            this.stopBtn.Location = new System.Drawing.Point(228, 65);
            this.stopBtn.Name = "stopBtn";
            this.stopBtn.Size = new System.Drawing.Size(75, 23);
            this.stopBtn.TabIndex = 4;
            this.stopBtn.Text = "Stop Timer";
            this.stopBtn.UseVisualStyleBackColor = true;
            this.stopBtn.Click += new System.EventHandler(this.StopTimerBtn_Click);
            // 
            // ProcessOutward
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(366, 163);
            this.Controls.Add(this.stopBtn);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.oceTypeComboBox);
            this.Controls.Add(this.statusLabel);
            this.Controls.Add(this.startOutwardProcessingBtn);
            this.MaximizeBox = false;
            this.Name = "ProcessOutward";
            this.Text = "Valued Clients OCE Processor";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button startOutwardProcessingBtn;
        private System.Windows.Forms.Label statusLabel;
        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.ComboBox oceTypeComboBox;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button stopBtn;
    }
}

